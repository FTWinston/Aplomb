using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aplomb.Common.Models
{
    public static class ReferenceValues
    {
        public static class FieldType
        {
            public static readonly int Boolean = 1;
            public static readonly int Date = 2;
            public static readonly int Decimal = 3;
            public static readonly int ForeignKey = 4;
            public static readonly int Integer = 5;
            public static readonly int FreeText = 6;
            public static readonly int Text = 7;
        }
    }
}
