namespace SmartCat.Entities.DocumentTypes.Repository
{
    using Common;
    using System.Collections.Generic;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-switchoff.png", Name = "Widgets", Description = "For defining widgets content", AllowAtRoot = false)]
    public class Widgets : Repository
    {
        #region SIDEBAR WIDGETS

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.MultipleNewsPostPicker,
                          Name = "News Sidebar Widget",
                          Tab = TabNames.Sidebar,
                          Description = "Choose news posts for sidebar widget.")]
        public virtual List<int> NewsWidget { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Numeric,
                        Name = "Number Of News Items",
                        Tab = TabNames.Sidebar,
                        Description = "Number of news items shown in sidebar widget.")]
        public virtual int NumberOfNewsItems { get; set; }

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