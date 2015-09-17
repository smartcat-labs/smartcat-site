using SmartCat.Entities.DocumentTypes.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-house.png",
        Name = "Home page",
        Description = "Home page document type.",
        AllowAtRoot = true,
        AllowedChildNodeTypes = new[] { typeof(Services), typeof(Team), typeof(Technologies), typeof(Process), typeof(Blog), typeof(News), typeof(Error404) })]
    public class Home : Page
    {

    }
}
