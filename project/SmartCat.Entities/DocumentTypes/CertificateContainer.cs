using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-addtolist.png", Name = "Certificate Container", Description = "Certificate container document type.", AllowAtRoot = false, AllowedChildNodeTypes = new[] {typeof(CertificateItem) })]
    public class CertificateContainer : Main
    {
    }
}
