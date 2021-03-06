﻿using System;
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
using Aplomb.Admin.Areas.Data.Models;

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

        // GET: /Data/Types/View
        public ActionResult View(int id)
        {
            var type = db.EntityTypes.Single(t => t.ID == id);
            var fieldTypes = GetFieldTypes();
            var entityTypes = GetEntityTypes();
            var model = new TypeEditModel(false, type, fieldTypes, entityTypes);
            return View("Type", model);
        }

        // POST: /Data/Types/AddField
        [HttpPost]
        public ActionResult AddField(int nextRowNum)
        {
            var fieldTypes = GetFieldTypes();
            var entityTypes = GetEntityTypes();
            var model = new FieldEditModel(false, nextRowNum.ToString(), null, fieldTypes, entityTypes);
            return PartialView("Field", model);
        }

        // POST: /Data/Types/CheckName
        [HttpPost]
        public ActionResult CheckName(int existingTypeID, string checkTypeName)
        {
            bool? isUnique;

            if (string.IsNullOrWhiteSpace(checkTypeName))
                isUnique = null;
            else
                isUnique = db.EntityTypes.SingleOrDefault(t => t.Name == checkTypeName && t.ID != existingTypeID) == null;
            return PartialView("NameUnique", isUnique);
        }

        private IEnumerable<FieldType> GetFieldTypes()
        {
            return db.FieldTypes.OrderBy(t => t.SortOrder).ThenBy(t => t.Name);
        }

        private IEnumerable<EntityType> GetEntityTypes()
        {
            return db.EntityTypes.OrderBy(t => t.Name);
        }

        [HttpPost]
        public ActionResult Save(FormCollection data)
        {
            int typeID;
            EntityType type;
            ICollection<Field> remainingFields;

            if (int.TryParse(data["typeID"], out typeID))
            {
                type = db.EntityTypes.Single(t => t.ID == typeID);
                remainingFields = new HashSet<Field>(type.Fields);
            }
            else
            {
                type = new EntityType();
                db.EntityTypes.Add(type);
                remainingFields = new HashSet<Field>();
            }

            type.Name = data["typeName"].Trim();

            var rowIDs = data["rowIDs"].Split(',');
            foreach (var row in rowIDs)
            {
                int rowNum = int.Parse(row);
                var strTypeID = data["type_" + rowNum];
                var strFieldID = data["fieldid_" + rowNum];
                var strSortOrder = data["sortorder_" + rowNum];
                var strNumMax = data["numMax_" + rowNum];
                var strNumMin = data["numMin_" + rowNum];

                Field field;
                if (strFieldID == null)
                {
                    field = new Field();
                    field.EntityType = type;
                    type.Fields.Add(field);
                }
                else
                {
                    var fieldID = int.Parse(strFieldID);
                    field = remainingFields.Single(f => f.ID == fieldID);
                    remainingFields.Remove(field);
                }

                field.Name = data["name_" + rowNum].Trim();
                field.TypeID = int.Parse(strTypeID);
                field.SortOrder = int.Parse(strSortOrder);

                var iNumMax = int.Parse(strNumMax);
                if (iNumMax < 1)
                    field.MaxNumber = null;
                else
                    field.MaxNumber = iNumMax;

                var iNumMin = int.Parse(strNumMin);
                if (iNumMin < 1)
                    field.MinNumber = 1;
                else
                    field.MinNumber = iNumMin;

                field.Mandatory = data["mand_" + rowNum] == "Y";

                if (field.TypeID == ReferenceValues.FieldType.Boolean)
                {
                    int value = int.Parse(data["boolDefault_" + rowIDs]);
                    if (value == 0 || value == 1)
                        field.NumericDefault = value;
                    else
                        field.NumericDefault = 0;

                    field.MinValue = null;
                    field.MaxValue = null;
                }

                if (field.TypeID == ReferenceValues.FieldType.Integer)
                {
                    field.NumericDefault = int.Parse(data["intDefault_" + rowIDs]);
                    
                    int iVal;
                    var strVal = data["numMin_" + rowNum];
                    if (int.TryParse(strVal, out iVal) && iVal > 0)
                        field.MinValue = iVal;
                    else
                        field.MinValue = 1;

                    strVal = data["numMax_" + rowNum];
                    if (int.TryParse(strVal, out iVal) && iVal >= field.MinValue)
                        field.MaxValue = iVal;
                    else
                        field.MinValue = null;
                }

                if (field.TypeID == ReferenceValues.FieldType.Decimal)
                {
                    field.NumericDefault = int.Parse(data["decimalDefault_" + rowIDs]);

                    int iVal;
                    var strVal = data["numMin_" + rowNum];
                    if (int.TryParse(strVal, out iVal) && iVal > 0)
                        field.MinValue = iVal;
                    else
                        field.MinValue = 1;

                    strVal = data["numMax_" + rowNum];
                    if (int.TryParse(strVal, out iVal) && iVal >= field.MinValue)
                        field.MaxValue = iVal;
                    else
                        field.MinValue = null;
                }
                
                if (field.TypeID == ReferenceValues.FieldType.Date)
                {
                    field.NumericDefault = int.Parse(data["dateDefault_" + rowIDs]);

                    int iVal;
                    var strVal = data["numMin_" + rowNum];
                    if (int.TryParse(strVal, out iVal) && iVal > 0)
                        field.MinValue = iVal;
                    else
                        field.MinValue = 1;

                    strVal = data["numMax_" + rowNum];
                    if (int.TryParse(strVal, out iVal) && iVal >= field.MinValue)
                        field.MaxValue = iVal;
                    else
                        field.MinValue = null;
                }

                if (field.TypeID == ReferenceValues.FieldType.ForeignKey)
                {
                    int foreignKeyTypeID = int.Parse("fkType_" + rowNum);

                    if (db.EntityTypes.SingleOrDefault(t => t.ID == foreignKeyTypeID) != null)
                        field.ForeignKeyEntityTypeID = foreignKeyTypeID;
                    else
                        field.ForeignKeyEntityTypeID = null;

                    field.MinValue = null;
                    field.MaxValue = null;
                    field.NumericDefault = null;
                }
                else
                    field.ForeignKeyEntityTypeID = null;
                
                if (field.TypeID == ReferenceValues.FieldType.Text || field.TypeID == ReferenceValues.FieldType.FreeText)
                {
                    var input = data["txtDefault_" + rowNum];
                    if (!string.IsNullOrWhiteSpace(input))
                        field.TextDefault = input.Trim();

                    var constraintType = data["txtType_" + rowNum];
                    if (constraintType == "length")
                    {
                        int iVal;
                        var strVal = data["txtLenMin_" + rowNum];
                        if (int.TryParse(strVal, out iVal) && iVal > 0)
                            field.MinValue = iVal;
                        else
                            field.MinValue = 1;

                        strVal = data["txtLenMax_" + rowNum];
                        if (int.TryParse(strVal, out iVal) && iVal >= field.MinValue)
                            field.MaxValue = iVal;
                        else
                            field.MinValue = null;

                        field.TextRegex = null;
                    }
                    else if (constraintType == "regex")
                    {
                        field.MinValue = null;
                        field.MaxValue = null;

                        input = data["txtRegex_" + rowNum];
                        if (!string.IsNullOrWhiteSpace(input))
                            field.TextRegex = input.Trim();
                        else
                            field.TextRegex = null;
                    }
                    else
                    {
                        field.MinValue = 1;
                        field.MaxValue = null;
                        field.TextRegex = null;
                    }
                    field.NumericDefault = null;
                }
                else
                    field.TextDefault = field.TextRegex = null;
            }

            foreach (var toRemove in remainingFields)
                db.Fields.Remove(toRemove);

            db.SaveChanges();
            return RedirectToAction("View", new { id = type.ID });
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
