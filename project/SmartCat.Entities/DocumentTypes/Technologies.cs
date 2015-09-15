using SmartCat.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-servers.png", Name = "Technologies", Description = "Technologies document type.", AllowAtRoot = false, AllowedChildNodeTypes = new[] { typeof(TechnologyItem), typeof(CertificateContainer) })]
    public class Technologies : Page
    {
        
    }
}
