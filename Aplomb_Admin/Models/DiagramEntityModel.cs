using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Aplomb.Admin.Models
{
    public class DiagramEntityModel
    {
        public int? ID { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }
        public int X { get; set; }
        public int Y { get; set; }
    }
}