using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace College_DB.Models;

public class Teacher
{
    public int TeacherId { get; set; }
    [Required, StringLength(50)]
    public string FirstName { get; set; } = string.Empty;
    [Required, StringLength(50)]
    public string LastName { get; set; } = string.Empty;
    [JsonIgnore]
    public List<Subject> Subjects { get; set; } = new();
}
