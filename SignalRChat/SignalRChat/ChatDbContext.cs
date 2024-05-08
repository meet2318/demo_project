using Microsoft.EntityFrameworkCore;
using SignalRChat.Models;
using System.Collections.Generic;

namespace SignalRChat.Data
{
    public class ChatDbContext : DbContext
    {
        public ChatDbContext(DbContextOptions<ChatDbContext> options)
            : base(options)
        {
        }

        public DbSet<ChatMessage> ChatMessages { get; set; }
    }
}
