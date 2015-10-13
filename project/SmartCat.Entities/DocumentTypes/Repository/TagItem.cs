using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes.Repository
{
    [DocumentType(IconUrl = "icon-tagalt-pricealt.png", Name = "Tag", Description = "Tag item", AllowAtRoot = false)]
    public class TagItem : Repository
    {
    }
}
