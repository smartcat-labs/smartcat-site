using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes.Repository
{
    [DocumentType(IconUrl = "icon-tags.png", Name = "Tags Container", Description = "Container for tag items", AllowedChildNodeTypes = new [] {typeof(TagItem)}, AllowAtRoot = false)]
    public class TagsContainer : Repository
    {

    }
}
