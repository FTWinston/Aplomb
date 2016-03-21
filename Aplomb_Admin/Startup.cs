using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Aplomb.Admin.Startup))]
namespace Aplomb.Admin
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
