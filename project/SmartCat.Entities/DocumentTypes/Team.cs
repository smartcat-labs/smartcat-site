namespace SmartCat.Entities.DocumentTypes
{
    using SmartCat.Common;
    using System.Collections.Generic;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-workshirt.png", Name = "Team", Description = "Team document type.", AllowAtRoot = false, AllowedChildNodeTypes = new[] { typeof(TeamMember) })]
    public class Team : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
                            Name = "Main body",
                            Description = "Define main content using RTE.",
                            Tab = TabNames.Content)]
        public virtual string MainContent { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                              OtherTypeName = Constants.CustomDataTypes.MultipleTeamMemberPicker,
                              Name = "Display Team Members",
                              Tab = TabNames.Content,
                              Description = "Choose team members to display on page.")]
        public virtual List<int> DisplayTeamMembers { get; set; }
    }
}