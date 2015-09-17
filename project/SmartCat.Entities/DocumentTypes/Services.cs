﻿using SmartCat.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-websitebuilder.png", Name = "Services", Description = "Services document type.", AllowAtRoot = false, AllowedChildNodeTypes = new[] { typeof(ServiceItem) })]
    public class Services : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,  Name = "Main body", Description = "Define main content using RTE.", Tab = TabNames.Content)]
        public virtual string RteContent { get; set; }

        #region SIDEBAR WIDGETS

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.MultipleNewsPostPicker,
                          Name = "News Sidebar Widget",
                          Tab = TabNames.Sidebar,
                          Description = "Choose news posts for sidebar widget.")]
        public virtual List<int> NewsWidget { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.MultipleTeamMemberPicker,
                          Name = "Team Sidebar Widget",
                          Tab = TabNames.Sidebar,
                          Description = "Choose team members for sidebar widget.")]
        public virtual List<int> TeamWidget { get; set; }

        #endregion
    }
}
