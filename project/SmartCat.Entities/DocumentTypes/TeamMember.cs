namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-tie-business.png", Name = "Team member", Description = "Team member document type.", AllowAtRoot = false)]
    public class TeamMember : Main
    {
        //[DocumentTypeProperty(UmbracoPropertyType.Other,
        //                   OtherTypeName = Constants.CustomDataTypes.TeamMemberImageCropper,
        //                   Name = "Profile Image",
        //                   Tab = TabNames.Content,
        //                   Description = "Member profile image.")]
        //public virtual string ProfileImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                          Name = "Home Image",
                          Tab = TabNames.Content,
                          Description = "Home slider image.")]
        public virtual int? HomeImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                          Name = "Team Image",
                          Tab = TabNames.Content,
                          Description = "Team member image.")]
        public virtual int? TeamImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                          Name = "Sidebar Image",
                          Tab = TabNames.Content,
                          Description = "Sidebar widget image.")]
        public virtual int? SidebarImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Technology Image",
                           Tab = TabNames.Content,
                           Description = "Small black & white technology image. Dimensions are 71x78 px.")]
        public virtual int? TechnologyImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Contact Image",
                           Tab = TabNames.Content,
                           Description = "Contact square image. Dimensions are 154x154 px.")]
        public virtual int? ContactImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                          Name = "First Name.",
                          Tab = TabNames.Content,
                          Description = "Member's first name.")]
        public virtual string FirstName { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                         Name = "Last Name.",
                         Tab = TabNames.Content,
                         Description = "Member's last name.")]
        public virtual string LastName { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                          Name = "Work Position.",
                          Tab = TabNames.Content,
                          Description = "Work position in the company.")]
        public virtual string WorkPosition { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                          Name = "Short Description.",
                          Tab = TabNames.Content,
                          Description = "Short about me.")]
        public virtual string ShortDescription { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                          Name = "Quote.",
                          Tab = TabNames.Content,
                          Description = "Short quote.")]
        public virtual string Quote { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                          Name = "Email address.",
                          Tab = TabNames.Content,
                          Description = "Member's email address.")]
        public virtual string EmailAddress { get; set; }

        #region SOCIAL

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "GitHub", Description = "GitHub url, including http://", Tab = TabNames.SocialLinks)]
        public virtual string GitHub { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "Twitter", Description = "Twitter url, including http://", Tab = TabNames.SocialLinks)]
        public virtual string Twitter { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "Facebook", Description = "Facebook url, including http://", Tab = TabNames.SocialLinks)]
        public virtual string Facebook { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "LinkedIn", Description = "LinkedIn url, including http://", Tab = TabNames.SocialLinks)]
        public virtual string LinkedIn { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "Stackoverflow", Description = "Stackoverflow url, including http://", Tab = TabNames.SocialLinks)]
        public virtual string Stackoverflow { get; set; }

        #endregion
    }
}