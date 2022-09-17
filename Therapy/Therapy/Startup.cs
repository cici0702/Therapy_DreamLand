using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Therapy.Startup))]
namespace Therapy
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
