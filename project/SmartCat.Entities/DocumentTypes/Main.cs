using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(Name = "Main", Description = "This is base document type for all document types.", AllowAtRoot = false)]
    public class Main : Vega.USiteBuilder.DocumentTypeBase
    {
    }
}
