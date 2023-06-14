using System.ComponentModel.DataAnnotations;


public class AuthModel
{
    [Required]
    public string? Token { get; set; }

    [Required]
    public string? User { get; set;}

}

