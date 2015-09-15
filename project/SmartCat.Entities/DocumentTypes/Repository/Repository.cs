using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes.Repository
{
    [DocumentType(IconUrl = "icon-equalizer.png", AllowedChildNodeTypes = new[] { typeof(Settings), typeof(Footer), typeof(Header) }, Description = "Repository.", AllowAtRoot = true)]
    public class Repository : Main
    {
    }
}
