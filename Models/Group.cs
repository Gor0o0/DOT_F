
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace College_DB.Models
{
    public class Group
    {
        public int GroupId { get; set; }
        [Required, StringLength(20)]
        public string? GroupName { get; set; }
        [JsonIgnore]
        public List<Student> Students { get; set; } = new();
    }
}
