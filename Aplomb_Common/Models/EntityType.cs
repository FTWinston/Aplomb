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
    
    public partial class EntityType
    {
        public EntityType()
        {
            this.Entities = new HashSet<Entity>();
            this.Fields = new HashSet<Field>();
            this.RightEntityTypes = new HashSet<RightEntityType>();
            this.Layouts = new HashSet<Layout>();
            this.DataDiagramEntityTypes = new HashSet<DataDiagramEntityType>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<Entity> Entities { get; set; }
        public virtual ICollection<Field> Fields { get; set; }
        public virtual ICollection<RightEntityType> RightEntityTypes { get; set; }
        public virtual ICollection<Layout> Layouts { get; set; }
        public virtual ICollection<DataDiagramEntityType> DataDiagramEntityTypes { get; set; }
    }
}