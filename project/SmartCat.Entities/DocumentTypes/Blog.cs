using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-buttonb.png", Name = "Blog", Description = "Blog container document type.", AllowAtRoot = false, AllowedChildNodeTypes = new [] {typeof(BlogPost)})]
    public class Blog : Page
    {
    }
}
