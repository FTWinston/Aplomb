using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Aplomb.Startup))]
namespace Aplomb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
