namespace SmartCat.Entities.DocumentTypes
{
    using SmartCat.Common;
    using System;
    using System.Collections.Generic;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-bullhorn.png",
        Name = "News Container",
        Description = "News container document type.",
        AllowAtRoot = false,
        AllowedChildNodeTypes = new[] { typeof(NewsPost) })]
    public class NewsContainer : Page
    {
        #region SIDEBAR WIDGETS

        [Obsolete]
        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.MultipleNewsPostPicker,
                          Name = "News Sidebar Widget",
                          Tab = TabNames.Sidebar,
                          Description = "Choose news posts for sidebar widget.")]
        private List<int> NewsWidget { get; set; }

        [Obsolete]
        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.MultipleTeamMemberPicker,
                          Name = "Team Sidebar Widget",
                          Tab = TabNames.Sidebar,
                          Description = "Choose team members for sidebar widget.")]
        private List<int> TeamWidget { get; set; }

        [Obsolete]
        [DocumentTypeProperty(UmbracoPropertyType.Other,
                         OtherTypeName = Constants.CustomDataTypes.MultipleServicePicker,
                         Name = "Service Sidebar Widget",
                         Tab = TabNames.Sidebar,
                         Description = "Choose services for sidebar widget.")]
        private List<int> ServiceWidget { get; set; }

        #endregion
    }
}