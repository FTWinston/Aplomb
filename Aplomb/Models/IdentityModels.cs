using Microsoft.AspNet.Identity.EntityFramework;

namespace Aplomb.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        //public string Name { get; set; }
    }

    public class AuthenticationDbContext : IdentityDbContext<ApplicationUser>
    {
        public AuthenticationDbContext()
            : base("Aplomb")
        {
        }
/*
        protected override void OnModelCreating(System.Data.Entity.DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<IdentityUser>().ToTable("zUsers", "dbo");
            modelBuilder.Entity<IdentityRole>().ToTable("zRoles", "dbo");
            modelBuilder.Entity<IdentityUserRole>().ToTable("zUserRoles", "dbo");
            modelBuilder.Entity<IdentityUserClaim>().ToTable("zClaims", "dbo");
            modelBuilder.Entity<IdentityUserLogin>().ToTable("zLogins", "dbo");
            /*

//            modelBuilder.Entity<IdentityUser>()
//                .ToTable("zUsers", "dbo").Property(p => p.Id).HasColumnName("User_Id");
//            
//            modelBuilder.Entity<UserAccount>()
//                .ToTable("zUsers", "dbo").Property(p => p.Id).HasColumnName("User_Id");
        }
*/
    }
}