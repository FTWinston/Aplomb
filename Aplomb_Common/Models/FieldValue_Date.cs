//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Aplomb.Common.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class FieldValue_Date
    {
        public int FieldValueID { get; set; }
        public System.DateTime Value { get; set; }
    
        public virtual FieldValue FieldValue { get; set; }
    }
}