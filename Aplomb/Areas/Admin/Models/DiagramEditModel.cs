using Aplomb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Aplomb.Areas.Admin.Models
{
    public class DiagramEditModel
    {
        public DataDiagram Diagram { get; private set; }
        public List<SelectListItem> OtherEntityTypes { get; private set; }
        public bool IsNew { get; private set; }

        public static DiagramEditModel Create(DataModel db, DataDiagram diagram, bool isNew)
        {
            var model = new DiagramEditModel();
            model.Diagram = diagram;
            model.IsNew = isNew;

            List<EntityType> otherEntityTypes;
            if (diagram == null)
            {
                otherEntityTypes = db.EntityTypes.ToList();
            }
            else
            {
                var diagramEntityTypes = diagram.DataDiagramEntityTypes.Select(de => de.EntityTypeID);
                otherEntityTypes = db.EntityTypes.Where(e => !diagramEntityTypes.Contains(e.ID)).ToList();
            }

            model.OtherEntityTypes = new List<SelectListItem>();
            model.OtherEntityTypes.AddRange(otherEntityTypes.Select(t => new SelectListItem() { Text = t.Name, Value = t.ID.ToString() }));
            return model;
        }
    }
}