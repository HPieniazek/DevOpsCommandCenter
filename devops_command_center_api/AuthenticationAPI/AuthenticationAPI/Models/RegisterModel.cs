using System.ComponentModel.DataAnnotations;

namespace AuthenticationAPI.Models
{
    public class RegisterModel
    {
        [Required]
        public string User { get; set; }

        [Required]
        public string Password { get; set; }

    }
}
