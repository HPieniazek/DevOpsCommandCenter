namespace AuthenticationAPI.Models
{
    public class MailModel
    {
        public string Email { get; set; }

        public string Subject { get; set; }

        public string Body { get; set; }
        
        public string From { get; set; }
        
        public string To { get; set; }
        
        public string Token { get; set; }
    }
}
