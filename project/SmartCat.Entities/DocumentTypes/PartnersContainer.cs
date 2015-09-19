using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-affiliate.png", Name = "Partners Container", Description = "Partner network container document type.", AllowAtRoot = false, AllowedChildNodeTypes = new [] {typeof(PartnerItem)})]
    public class PartnersContainer : Main
    {
    }
}
