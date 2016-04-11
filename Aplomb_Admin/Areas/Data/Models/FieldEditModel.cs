using Aplomb.Common.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Aplomb.Admin.Areas.Data.Models
{
    public class FieldEditModel
    {
        public FieldEditModel(bool readOnly, string rowID, Field field, IEnumerable<FieldType> fieldTypes)
        {
            ReadOnly = readOnly;
            RowID = rowID;
            Field = field;
            FieldTypes = fieldTypes;
        }

        public bool ReadOnly { get; private set; }
        public string RowID { get; private set; }
        public Field Field { get; private set; }
        public IEnumerable<FieldType> FieldTypes { get; private set; }

        public IEnumerable<SelectListItem> FieldTypeItems
        {
            get { return FieldTypes.Select(t => new SelectListItem() { Value = t.ID.ToString(), Text = t.Name, Selected = Field != null && Field.TypeID == t.ID }); }
        }

        public IEnumerable<SelectListItem> MandatoryItems
        {
            get
            {
                yield return new SelectListItem() { Value = "Y", Text = "Yes", Selected = true };
                yield return new SelectListItem() { Value = "N", Text = "No", Selected = false };
            }
        }

        public string FieldNameLabel { get { return "Name"; } }
        public string FieldTypeLabel { get { return "Type"; } }
        public string AddFieldLabel { get { return "add field"; } }
        public string AddFieldTooltip { get { return "Add a new, blank field to this entity type"; } }
    }
}