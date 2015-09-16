using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-reliability.png", Name = "Process", Description = "Process document type.", AllowAtRoot = false, AllowedChildNodeTypes = new [] {typeof(ProcessItem)})]
    public class Process : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor, Name = "Main body", Description = "Define main content using RTE.", Tab = TabNames.Content)]
        public virtual string RteContent { get; set; }
    }
}
