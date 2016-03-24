using System.Web.Mvc;

namespace Aplomb.Admin.Areas.Data
{
    public class DataAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Data";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Data_default",
                "Data/{controller}/{action}/{id}",
                new { area = "Data", controller = "Diagrams", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}