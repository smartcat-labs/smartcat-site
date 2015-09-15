using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-workshirt.png", Name = "Team", Description = "Team document type.", AllowAtRoot = false, AllowedChildNodeTypes = new [] {typeof(TeamMember)})]
    public class Team : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
                            Name = "Main body",
                            Description = "Define main content using RTE.",
                            Tab = TabNames.Content)]
        public virtual string MainContent { get; set; }
    }
}
