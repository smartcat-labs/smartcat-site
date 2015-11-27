using SmartCat.Common;
using System;
using System.Collections.Generic;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-servers.png",
        Name = "Technologies",
        Description = "Technologies document type.",
        AllowAtRoot = false,
        AllowedChildNodeTypes = new[]
        {
            typeof(CertificateContainer),
            typeof(TechnologyContainer)
        })]
    public class Technologies : Page
    {
        #region SIDEBAR WIDGETS

        [Obsolete]
        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.MultipleTeamMemberPicker,
                          Name = "Team Sidebar Widget",
                          Tab = TabNames.Sidebar,
                          Description = "Choose team members for sidebar widget.")]
        private List<int> TeamWidget { get; set; }

        [Obsolete]
        [DocumentTypeProperty(UmbracoPropertyType.Other,
                  OtherTypeName = Constants.CustomDataTypes.MultipleNewsPostPicker,
                  Name = "News Sidebar Widget",
                  Tab = TabNames.Sidebar,
                  Description = "Choose news posts for sidebar widget.")]
        private List<int> NewsWidget { get; set; }

        #endregion
    }
}