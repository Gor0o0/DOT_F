const resources = {
  students: { title:'Студенты', id:'studentId', fields:[['firstName','Имя','text',50],['lastName','Фамилия','text',50],['age','Возраст','number',120],['groupId','Группа','select','groups']] },
  groups: { title:'Группы', id:'groupId', fields:[['groupName','Название группы','text',20]] },
  subjects: { title:'Предметы', id:'subjectId', fields:[['subjectName','Название предмета','text',80],['teacherId','Преподаватель','select','teachers']] },
  teachers: { title:'Преподаватели', id:'teacherId', fields:[['firstName','Имя','text',50],['lastName','Фамилия','text',50]] },
  grades: { title:'Оценки', id:'gradeId', fields:[['studentId','Студент','select','students'],['subjectId','Предмет','select','subjects'],['value','Оценка (1–5)','number',5],['gradeDate','Дата','date']] }
};
const relationLabels = { groupId:'groups', teacherId:'teachers', studentId:'students', subjectId:'subjects' };
const dataCache = {};
let active = 'students';
let editingId = null;

document.addEventListener('DOMContentLoaded', async () => {
  buildTabs();
  document.getElementById('editorForm').addEventListener('submit', saveRecord);
  document.getElementById('cancel').addEventListener('click', resetForm);
  document.getElementById('refresh').addEventListener('click', () => loadRecords());
  document.getElementById('tableBody').addEventListener('click', handleRowAction);
  await Promise.all(Object.keys(resources).map(key => loadRecords(key, false)));
  await activate('students');
});

function buildTabs() {
  const tabs = document.getElementById('tabs');
  for (const [key, resource] of Object.entries(resources)) {
    const button = document.createElement('button');
    button.className = 'tab'; button.type = 'button'; button.dataset.resource = key;
    button.textContent = resource.title;
    button.addEventListener('click', () => activate(key));
    tabs.append(button);
  }
}

async function api(url, options = {}) {
  const response = await fetch(url, { ...options, headers: { ...(options.body ? {'Content-Type':'application/json'} : {}), ...options.headers } });
  const body = await response.text();
  let result = null;
  try { result = body ? JSON.parse(body) : null; } catch { result = body; }
  if (!response.ok) {
    let message = result?.detail || result?.title || result?.message || (typeof result === 'string' ? result : '');
    if (response.status === 409 || response.status === 500) message ||= 'Операция невозможна: проверьте связи записи и доступность базы данных.';
    throw new Error(message || `Ошибка запроса (${response.status})`);
  }
  return result;
}

async function loadRecords(key = active, announceError = true) {
  try {
    dataCache[key] = await api(`/api/${key}`);
    if (key === active) renderTable();
    return dataCache[key];
  } catch (error) {
    if (announceError && key === active) message(error.message, true);
    return null;
  }
}

async function activate(key) {
  active = key; editingId = null;
  document.querySelectorAll('.tab').forEach(button => button.classList.toggle('active', button.dataset.resource === key));
  const resource = resources[key];
  document.getElementById('sectionTitle').textContent = resource.title;
  document.getElementById('listTitle').textContent = `Список: ${resource.title.toLowerCase()}`;
  resetForm();
  try {
    for (const [, , type, source] of resource.fields) if (type === 'select' && !dataCache[source]) dataCache[source] = await api(`/api/${source}`);
    renderForm();
    await loadRecords(key);
  } catch (error) { message(error.message, true); }
}

function fieldLabel(key) { return resources[relationLabels[key]]?.title.slice(0, -1) || key; }

function renderForm(values = {}) {
  const container = document.getElementById('fields'); container.replaceChildren();
  for (const [key, label, type, limit] of resources[active].fields) {
    const wrapper = document.createElement('label'); wrapper.className = 'field'; wrapper.append(document.createTextNode(label));
    let input;
    if (type === 'select') {
      input = document.createElement('select'); input.required = true;
      const placeholder = new Option('Выберите запись…', ''); placeholder.disabled = true; placeholder.selected = !values[key]; input.add(placeholder);
      for (const item of dataCache[limit] || []) {
        const name = item.groupName || item.subjectName || `${item.firstName} ${item.lastName}`;
        input.add(new Option(`${name} · #${item[resources[limit].id]}`, item[resources[limit].id]));
      }
    } else {
      input = document.createElement('input'); input.type = type; input.required = true;
      if (type === 'text') input.maxLength = limit;
      if (type === 'number') { input.min = key === 'age' ? '1' : key === 'value' ? '1' : '1'; input.max = String(limit); input.step = '1'; }
      if (type === 'date') input.max = new Date().toISOString().slice(0,10);
    }
    input.name = key;
    if (values[key] != null) input.value = values[key];
    wrapper.append(input); container.append(wrapper);
  }
}

function renderTable() {
  const resource = resources[active], rows = dataCache[active] || [];
  const columns = resource.fields.map(([key, label]) => [key, label]);
  document.getElementById('tableHead').innerHTML = `<tr><th>ID</th>${columns.map(([,label])=>`<th>${escapeHtml(label)}</th>`).join('')}<th></th></tr>`;
  const body = document.getElementById('tableBody'); body.replaceChildren();
  for (const item of rows) {
    const row = document.createElement('tr');
    const id = item[resource.id];
    row.append(cell(`#${id}`, 'id-cell'));
    for (const [key] of columns) {
      let value = item[key];
      if (relationLabels[key]) {
        const linked = (dataCache[relationLabels[key]] || []).find(x => x[resources[relationLabels[key]].id] === value);
        value = linked ? `${linked.groupName || linked.subjectName || `${linked.firstName} ${linked.lastName}`} · #${value}` : `#${value}`;
      }
      if (key === 'gradeDate' && value) value = new Date(`${value}T00:00:00`).toLocaleDateString('ru-RU');
      row.append(cell(value ?? '—'));
    }
    const actions = cell(''); actions.className = 'row-actions-cell';
    const wrap = document.createElement('div'); wrap.className = 'row-actions';
    const edit = document.createElement('button'); edit.className = 'action'; edit.type = 'button'; edit.dataset.action = 'edit'; edit.dataset.id = id; edit.textContent = 'Изменить';
    const del = document.createElement('button'); del.className = 'action delete'; del.type = 'button'; del.dataset.action = 'delete'; del.dataset.id = id; del.textContent = 'Удалить';
    wrap.append(edit, del); actions.append(wrap); row.append(actions); body.append(row);
  }
  document.getElementById('count').textContent = `${rows.length} ${plural(rows.length)}`;
  document.getElementById('empty').hidden = rows.length !== 0;
}

function cell(value, className = '') { const td = document.createElement('td'); td.textContent = value; if (className) td.className = className; return td; }
function plural(n) { return n % 10 === 1 && n % 100 !== 11 ? 'запись' : n % 10 >= 2 && n % 10 <= 4 && (n % 100 < 12 || n % 100 > 14) ? 'записи' : 'записей'; }
function escapeHtml(value) { return String(value).replace(/[&<>"']/g, char => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[char])); }

async function saveRecord(event) {
  event.preventDefault();
  const form = event.currentTarget;
  if (!form.reportValidity()) return;
  const values = Object.fromEntries(new FormData(form));
  for (const [key, value] of Object.entries(values)) if (key !== 'gradeDate' && key !== 'firstName' && key !== 'lastName' && key !== 'groupName' && key !== 'subjectName') values[key] = Number(value);
  const button = document.getElementById('save'); button.disabled = true;
  try {
    const path = `/api/${active}${editingId ? `/${editingId}` : ''}`;
    await api(path, { method: editingId ? 'PUT' : 'POST', body: JSON.stringify(values) });
    message(editingId ? 'Изменения сохранены.' : 'Запись добавлена.'); resetForm();
    await loadRecords();
  } catch (error) { message(error.message, true); }
  finally { button.disabled = false; }
}

async function handleRowAction(event) {
  const button = event.target.closest('button[data-action]'); if (!button) return;
  const id = Number(button.dataset.id), item = dataCache[active].find(x => x[resources[active].id] === id);
  if (button.dataset.action === 'edit') {
    editingId = id; renderForm(item);
    document.getElementById('formTitle').textContent = `Изменение записи #${id}`;
    document.getElementById('save').textContent = 'Сохранить изменения'; document.getElementById('cancel').hidden = false;
    document.getElementById('editorForm').scrollIntoView({behavior:'smooth', block:'center'});
    return;
  }
  if (!confirm(`Удалить запись #${id}?`)) return;
  button.disabled = true;
  try { await api(`/api/${active}/${id}`, {method:'DELETE'}); message('Запись удалена.'); await loadRecords(); }
  catch (error) { message(error.message, true); }
  finally { button.disabled = false; }
}

function resetForm() {
  editingId = null;
  document.getElementById('formTitle').textContent = 'Новая запись';
  document.getElementById('save').textContent = 'Добавить запись';
  document.getElementById('cancel').hidden = true;
  renderForm();
}

function message(text, error = false) { const node = document.getElementById('notice'); node.textContent = text; node.classList.toggle('error', error); }
