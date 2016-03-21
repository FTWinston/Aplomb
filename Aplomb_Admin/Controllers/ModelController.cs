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

namespace Aplomb.Admin.Controllers
{
    public class ModelController : Controller
    {
        private DataModel db = new DataModel();

        #region diagrams
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

            var model = DiagramEditModel.Create(db, diagram, false);
            return View("Diagram", model);
        }

        // GET: /Admin/Model/CreateDiagram
        public ActionResult CreateDiagram()
        {
            var model = DiagramEditModel.Create(db, null, true);
            return View("Diagram", model);
        }

        // POST: /Admin/Model/CreateDiagram
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateDiagram([Bind(Include = "Name")] DataDiagram diagram, string layout)
        {
            if (ModelState.IsValid)
            {
                if (db.DataDiagrams.Count() == 0)
                    diagram.SortOrder = 1;
                else
                    diagram.SortOrder = db.DataDiagrams.Max(d => d.SortOrder) + 1;

                db.DataDiagrams.Add(diagram);
                SaveDiagramEntities(diagram, layout, false);
                db.SaveChanges();

                return RedirectToAction("Index");
            }

            var model = DiagramEditModel.Create(db, diagram, true);
            return View("Diagram", model);
        }

        // POST: /Admin/Model/EditDiagram/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditDiagram([Bind(Include="ID,Name,SortOrder")] DataDiagram diagram, string layout)
        {
            if (ModelState.IsValid)
            {
                string name = diagram.Name;
                int sortOrder = diagram.SortOrder;
                diagram = db.DataDiagrams.First(d => d.ID == diagram.ID); // it seems this is required to populate the DataDiagramEntityTypes list - Attach then Reload doesn't work.
                diagram.Name = name;
                diagram.SortOrder = sortOrder;

                SaveDiagramEntities(diagram, layout, true);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            var model = DiagramEditModel.Create(db, diagram, false);
            return View("Diagram", model);
        }

        private void SaveDiagramEntities(DataDiagram diagram, string layoutJson, bool hasExisting)
        {
            if (hasExisting)
            {
                db.DataDiagramEntityTypes.RemoveRange(diagram.DataDiagramEntityTypes); // TODO: don't delete records we will just recreate
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            var entities = js.Deserialize<DiagramEntityModel[]>(layoutJson);

            foreach (var entity in entities.Where(e => e.ID.HasValue))
            {
                var diagramEntity = new DataDiagramEntityType()
                {
                    EntityTypeID = entity.ID.Value, // TODO: verify that this exists
                    PositionX = entity.X,
                    PositionY = entity.Y,
                    Color = entity.Color,
                    DataDiagram = diagram
                };
                db.DataDiagramEntityTypes.Add(diagramEntity);
            }

            foreach (var entity in entities.Where(e => !e.ID.HasValue))
            {
                EntityType entityType = new EntityType()
                {
                    Name = entity.Name // TODO: verify that this isn't already used
                };

                db.EntityTypes.Add(entityType);

                var diagramEntity = new DataDiagramEntityType()
                {
                    EntityType = entityType,
                    PositionX = entity.X,
                    PositionY = entity.Y,
                    Color = entity.Color,
                    DataDiagram = diagram
                };
                db.DataDiagramEntityTypes.Add(diagramEntity);
            }
        }

        // GET: /Admin/Model/DeleteDiagram/5
        public ActionResult DeleteDiagram(int? id)
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

        // POST: /Admin/Model/DeleteDiagram/5
        [HttpPost, ActionName("DeleteDiagram")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteDiagramConfirmed(int id)
        {
            DataDiagram datadiagram = db.DataDiagrams.Find(id);
            db.DataDiagrams.Remove(datadiagram);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        #endregion

        #region types
        // POST: /Admin/Model/Type
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Type(int typeID, int diagramID)
        {
            return View("Type");
        }
        #endregion types

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
