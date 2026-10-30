
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace College_DB.Models
{
    public class Student
    {
        public int StudentId { get; set; } = 0;
        [Required, StringLength(50)]
        public string FirstName { get; set; } = string.Empty;
        [Required, StringLength(50)]
        public string LastName { get; set; } = string.Empty;
        [Range(1, 120)]
        public int Age { get; set; }

        [Range(1, int.MaxValue)]
        public int GroupId { get; set; }
        [JsonIgnore]
        public Group? Group { get; set; }

    }
}
