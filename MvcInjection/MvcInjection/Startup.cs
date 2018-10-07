using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MvcInjection.Startup))]
namespace MvcInjection
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
