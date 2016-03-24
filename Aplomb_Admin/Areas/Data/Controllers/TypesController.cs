using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Aplomb.Admin.Models;
using System.Web.Script.Serialization;
using Aplomb.Common.Models;

namespace Aplomb.Admin.Areas.Data.Controllers
{
    public class TypesController : Controller
    {
        private DataModel db = new DataModel();

        // GET: /Data/Types/
        public ActionResult Index()
        {
            return View("List", db.EntityTypes.OrderBy(t => t.Name).ToList());
        }

        // POST: /Data/Types/View
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult View(int typeID, int diagramID)
        {
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
