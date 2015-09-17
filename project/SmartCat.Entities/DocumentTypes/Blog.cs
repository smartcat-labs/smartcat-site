using SmartCat.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-buttonb.png", Name = "Blog Container", Description = "Blog container document type.", AllowAtRoot = false, AllowedChildNodeTypes = new[] { typeof(BlogPost) })]
    public class Blog : Page
    {
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

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                         OtherTypeName = Constants.CustomDataTypes.MultipleServicePicker,
                         Name = "Service Sidebar Widget",
                         Tab = TabNames.Sidebar,
                         Description = "Choose services for sidebar widget.")]
        public virtual List<int> ServiceWidget { get; set; }

        #endregion
    }
}
