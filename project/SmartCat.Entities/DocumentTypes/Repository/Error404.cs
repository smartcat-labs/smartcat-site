using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes.Repository
{
    [DocumentType(IconUrl = "icon-turnright.png", Name = "Error 404", Description = "Error 404 document type.", AllowAtRoot = false)]
    public class Error404 : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
                     Name = "Main body",
                     Description = "Define main content using RTE.",
                     Tab = TabNames.Content)]
        public virtual string RteContent { get; set; }
    }
}
