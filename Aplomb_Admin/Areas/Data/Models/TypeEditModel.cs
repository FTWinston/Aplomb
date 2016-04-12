using Aplomb.Common.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Aplomb.Admin.Areas.Data.Models
{
    public class TypeEditModel
    {
        public TypeEditModel(bool readOnly, EntityType type, IEnumerable<FieldType> fieldTypes, IEnumerable<EntityType> entityTypes)
        {
            ReadOnly = readOnly;
            Type = type;
            FieldTypes = fieldTypes;
            EntityTypes = entityTypes;
        }

        public int BooleanTypeID { get { return 1; } }
        public int DateTypeID { get { return 2; } }
        public int DecimalTypeID { get { return 3; } }
        public int ForeignKeyTypeID {  get { return 4; } }
        public int IntegerTypeID { get { return 5; } }
        public int FreeTextTypeID { get { return 6; } }
        public int TextTypeID { get { return 7; } }

        public bool ReadOnly { get; private set; }
        public EntityType Type { get; private set; }
        public IEnumerable<FieldType> FieldTypes { get; private set; }
        public IEnumerable<EntityType> EntityTypes { get; private set; }

        public string TypeNameLabel { get { return "Entity type name"; } }
        public string TypeNameDescription { get { return "Name of this entity type"; } }
        public string AddFieldLabel { get { return "add field"; } }
        public string AddFieldTooltip { get { return "Add a new, blank field to this entity type"; } }
    }
}