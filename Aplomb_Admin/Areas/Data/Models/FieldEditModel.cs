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
        public FieldEditModel(bool readOnly, string rowID, Field field, IEnumerable<FieldType> fieldTypes, IEnumerable<EntityType> entityTypes)
        {
            ReadOnly = readOnly;
            RowID = rowID;
            Field = field;
            FieldTypes = fieldTypes;
            EntityTypes = entityTypes;
        }

        public bool ReadOnly { get; private set; }
        public string RowID { get; private set; }
        public Field Field { get; private set; }
        public IEnumerable<FieldType> FieldTypes { get; private set; }
        public IEnumerable<EntityType> EntityTypes { get; private set; }

        public IEnumerable<SelectListItem> FieldTypeItems
        {
            get { return FieldTypes.Select(t => new SelectListItem() { Value = t.ID.ToString(), Text = t.Name, Selected = Field != null && Field.TypeID == t.ID }); }
        }

        public IEnumerable<SelectListItem> EntityTypeItems
        {
            get { return EntityTypes.Select(t => new SelectListItem() { Value = t.ID.ToString(), Text = t.Name, Selected = false }); }
        }

        public IEnumerable<SelectListItem> MandatoryItems
        {
            get
            {
                yield return new SelectListItem() { Value = "Y", Text = "Always", Selected = true };
                yield return new SelectListItem() { Value = "N", Text = "Never", Selected = false };
                yield return new SelectListItem() { Value = "?", Text = "Only when...", Selected = false };
            }
        }

        public IEnumerable<SelectListItem> MinQuantityItems
        {
            get
            {
                var current = Field == null ? 1 : Field.MinNumber;

                for (int i = 1; i <= 10; i++)
                    yield return new SelectListItem() { Value = i.ToString(), Text = "At least " + i, Selected = current == i };
            }
        }

        public IEnumerable<SelectListItem> MaxQuantityItems
        {
            get
            {
                var current = Field == null ? 1 : Field.MaxNumber.HasValue ? Field.MaxNumber.Value : 0;

                yield return new SelectListItem() { Value = "0", Text = "Unlimited", Selected = current == 0 };

                for (int i=1; i<=10; i++)
                    yield return new SelectListItem() { Value = i.ToString(), Text = "At most " + i, Selected = current == i };
            }
        }

        public IEnumerable<SelectListItem> TextConstraintItems
        {
            get
            {
                yield return new SelectListItem() { Value = "length", Text = "Length", Selected = true };
                yield return new SelectListItem() { Value = "regex", Text = "Regular expression", Selected = false };
            }
        }

        public IEnumerable<SelectListItem> BoolValueItems
        {
            get
            {
                yield return new SelectListItem() { Value = "0", Text = "Unchecked", Selected = true };
                yield return new SelectListItem() { Value = "1", Text = "Checked", Selected = false };
            }
        }

        public string FieldNameLabel { get { return "Name"; } }
        public string FieldTypeLabel { get { return "Type"; } }
        public string AddFieldLabel { get { return "add field"; } }
        public string AddFieldTooltip { get { return "Add a new, blank field to this entity type"; } }
    }
}