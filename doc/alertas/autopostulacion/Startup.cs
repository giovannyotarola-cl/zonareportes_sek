using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AutoPostulacion.Startup))]
namespace AutoPostulacion
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
