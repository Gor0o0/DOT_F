using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace College_DB.Models;

public class Subject
{
    public int SubjectId { get; set; }
    [Required, StringLength(80)]
    public string SubjectName { get; set; } = string.Empty;
    [Range(1, int.MaxValue)]
    public int TeacherId { get; set; }
    [JsonIgnore]
    public Teacher? Teacher { get; set; }
    [JsonIgnore]
    public List<Grade> Grades { get; set; } = new();
}
