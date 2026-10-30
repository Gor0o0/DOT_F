using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace College_DB.Models;

public class Grade
{
    public int GradeId { get; set; }
    [Range(1, int.MaxValue)]
    public int StudentId { get; set; }
    [Range(1, int.MaxValue)]
    public int SubjectId { get; set; }
    [Range(1, 5)]
    public int Value { get; set; }
    public DateOnly GradeDate { get; set; } = DateOnly.FromDateTime(DateTime.Today);
    [JsonIgnore]
    public Student? Student { get; set; }
    [JsonIgnore]
    public Subject? Subject { get; set; }
}
