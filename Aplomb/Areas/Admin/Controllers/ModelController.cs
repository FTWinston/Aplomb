using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Aplomb.Models;
using Aplomb.Areas.Admin.Models;

namespace Aplomb.Areas.Admin.Controllers
{
    public class ModelController : Controller
    {
        private DataModel db = new DataModel();

        // GET: /Admin/Model/
        public ActionResult Index()
        {
            return View(db.DataDiagrams.OrderBy(d => d.SortOrder).ToList());
        }

        // GET: /Admin/Model/Diagram/5
        public ActionResult Diagram(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DataDiagram diagram = db.DataDiagrams.Find(id);
            if (diagram == null)
            {
                return HttpNotFound();
            }

            var model = DiagramEditModel.Create(db, diagram);
            return View("Diagram", model);
        }

        // GET: /Admin/Model/CreateDiagram
        public ActionResult CreateDiagram()
        {
            var model = DiagramEditModel.Create(db, null);
            return View("Diagram", model);
        }

        // POST: /Admin/Model/CreateDiagram
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateDiagram([Bind(Include = "Name")] DataDiagram diagram)
        {
            if (ModelState.IsValid)
            {
                if (db.DataDiagrams.Count() == 0)
                    diagram.SortOrder = 1;
                else
                    diagram.SortOrder = db.DataDiagrams.Max(d => d.SortOrder) + 1;

                db.DataDiagrams.Add(diagram);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            var model = DiagramEditModel.Create(db, diagram);
            return View("Diagram", model);
        }

        // POST: /Admin/Model/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditDiagram([Bind(Include="ID,Name,SortOrder")] DataDiagram diagram)
        {
            if (ModelState.IsValid)
            {
                db.Entry(diagram).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            var model = DiagramEditModel.Create(db, diagram);
            return View("Diagram", model);
        }

        // GET: /Admin/Model/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DataDiagram datadiagram = db.DataDiagrams.Find(id);
            if (datadiagram == null)
            {
                return HttpNotFound();
            }
            return View(datadiagram);
        }

        // POST: /Admin/Model/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DataDiagram datadiagram = db.DataDiagrams.Find(id);
            db.DataDiagrams.Remove(datadiagram);
            db.SaveChanges();
            return RedirectToAction("Index");
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
