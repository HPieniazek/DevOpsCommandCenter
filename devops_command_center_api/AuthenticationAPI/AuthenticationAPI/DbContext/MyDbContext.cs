
using AuthenticationAPI.Models;
using Microsoft.EntityFrameworkCore;

public class MyDbContext : DbContext
{
    public MyDbContext (DbContextOptions<MyDbContext> options) : base(options)
    { }

    public DbSet<MailModel> Mails { get; set; }
}

