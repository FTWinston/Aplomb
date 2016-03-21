using Aplomb.Common.Models;
using Aplomb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Aplomb.Controllers
{
    public class PageController : Controller
    {
        public ActionResult Display(string section, string page, int? id)
        {
            DataModel dm = new DataModel();
            var pageModel = dm.Pages.Where(p => p.Section.Slug == section && p.Slug == page).SingleOrDefault();

            if (pageModel == null)
                return HttpNotFound();

            ViewBag.Section = pageModel.Section.Name;
            ViewBag.Page = pageModel.Slug;
            ViewBag.ID = id;
            return View("Test");
        }
	}
}