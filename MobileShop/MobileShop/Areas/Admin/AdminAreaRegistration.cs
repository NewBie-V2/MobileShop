using System.Web.Mvc;
using System.Web.Routing;

namespace MobileShop.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            //context.Routes.Add(new Route("admin/{sub}/{resource}.axd/{*pathInfo}", new StopRoutingHandler()));
            //context.Routes.Add(new Route("admin/{resource}.axd/{*pathInfo}", new StopRoutingHandler()));

            context.MapRoute(
                name: "Admin_default",    
                url: "Admin/{controller}/{action}/{id}",
                defaults: new { action = "Index", controller = "Home", id = UrlParameter.Optional },
                //new { action = "Index", controller = "Home", id = UrlParameter.Optional,},
                namespaces: new[] { "MobileShop.Areas.Admin.Controllers" }
            );
        }
    }
}