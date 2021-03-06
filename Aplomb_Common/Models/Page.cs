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
    
    public partial class Page
    {
        public Page()
        {
            this.MenuItems = new HashSet<MenuItem>();
            this.RightPages = new HashSet<RightPage>();
        }
    
        public int ID { get; set; }
        public int PageTypeID { get; set; }
        public int LayoutID { get; set; }
        public string Title { get; set; }
        public string Slug { get; set; }
        public Nullable<int> SectionID { get; set; }
    
        public virtual Layout Layout { get; set; }
        public virtual ICollection<MenuItem> MenuItems { get; set; }
        public virtual PageType PageType { get; set; }
        public virtual ICollection<RightPage> RightPages { get; set; }
        public virtual Section Section { get; set; }
    }
}
