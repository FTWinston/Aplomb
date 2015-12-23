using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Aplomb
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Static",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                constraints: new { controller = new StaticPageConstraint() }
            );

            routes.MapRoute(
                name: "Dynamic",
                url: "{section}/{page}/{id}",
                defaults: new { controller = "Page", action = "Display", page = UrlParameter.Optional, id = UrlParameter.Optional }
            );
        }

        public class StaticPageConstraint : IRouteConstraint
        {
            private static SortedSet<string> siteControllers = null;

            public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
            {
                if (siteControllers == null)
                    PopulateControllerList();

                string value = values[parameterName].ToString();
                return siteControllers.Contains(value);
            }

            private void PopulateControllerList()
            {
                const string suffix = "Controller";
                siteControllers = new SortedSet<string>(StringComparer.InvariantCultureIgnoreCase);
                var types = GetType().Assembly.GetTypes().Where(t => t.Namespace == "Aplomb.Controllers" && t.Name.EndsWith(suffix) & t != typeof(Aplomb.Controllers.PageController));

                foreach (var type in types)
                    siteControllers.Add(type.Name.Substring(0, type.Name.Length - suffix.Length));
            }
        }
    }
}
