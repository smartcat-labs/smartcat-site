using SmartCat.Common;
using System;
using System.Collections.Generic;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-reliability.png", Name = "Process", Description = "Process document type.", AllowAtRoot = false, AllowedChildNodeTypes = new[] { typeof(ProcessItem) })]
    public class Process : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor, Name = "Main body", Description = "Define main content using RTE.", Tab = TabNames.Content)]
        public virtual string RteContent { get; set; }

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

        #endregion
    }
}