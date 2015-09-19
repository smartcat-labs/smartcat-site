using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;
using SmartCat.Entities.DocumentTypes.Repository;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-websitealt.png", Name = "Language", Description = "New language document type.", AllowAtRoot = true, AllowedChildNodeTypes = new [] {typeof(Home), typeof(Repository.Repository)})]
    public class Language : Main
    {
    }
}
