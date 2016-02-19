namespace SmartCat.Entities.DocumentTypes
{
    using Common;
    using DataTypes;
    using Repository;
    using System;
    using System.Collections.Generic;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-house.png",
        Name = "Home page",
        Description = "Home page document type.",
        AllowAtRoot = true,
        AllowedChildNodeTypes = new[]
        {
            typeof(Services),
            typeof(Team),
            typeof(Technologies),
            typeof(Process),
            typeof(Blog),
            typeof(News),
            typeof(Error404),
            typeof(Search),
            typeof(TestimonialContainer),
            typeof(PartnersContainer),
            typeof(Contact),
            typeof(Expertise)
        })]
    public class Home : Page
    {
        #region HOME BANNER

        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Slider Image",
                           Tab = TabNames.HomeBanner,
                           Description = "Home slider image. Dimensions are 1008x906 px.")]
        public virtual int? SliderImage { get; set; }


        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Abstract Image",
                           Tab = TabNames.HomeBanner,
                           Description = "Home abstract image. Dimensions are 725x812 px.")]
        public virtual int? AbstractImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
                    Name = "Slider Text",
                    Description = "Featured text over home slider.",
                    Tab = TabNames.HomeBanner)]
        public virtual string FeaturedText { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                   OtherTypeName = Constants.CustomDataTypes.UrlPicker,
                   Name = "Featured Button",
                   Tab = TabNames.HomeBanner,
                   Description = "External or internal url.")]
        public virtual UrlPicker FeaturedButton { get; set; }

        #endregion

        #region FEATURED EXPERTISE

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                 OtherTypeName = Constants.CustomDataTypes.MultipleExpertisePicker,
                 Name = "Featured Expertise",
                 Tab = TabNames.FeaturedExpertise,
                 Description = "Choose featured expertise.")]
        public virtual List<int> FeaturedExpertise { get; set; }

        [Obsolete]
        [DocumentTypeProperty(UmbracoPropertyType.Other,
                 OtherTypeName = Constants.CustomDataTypes.MultipleServicePicker,
                 Name = "Featured Services",
                 Tab = TabNames.FeaturedServices,
                 Description = "Choose featured services.")]
        public virtual List<int> FeaturedServices { get; set; }

        #endregion

        #region ABOUT US

        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
            Name = "About Us",
            Description = "About us description.",
            Tab = TabNames.AboutUs)]
        public virtual string AboutText { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
           OtherTypeName = Constants.CustomDataTypes.UrlPicker,
           Name = "Link Button",
           Tab = TabNames.AboutUs,
           Description = "External or internal url.")]
        public virtual UrlPicker LinkButton { get; set; }

        #endregion

        #region OUR PROCESS

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.MultipleProcessPicker,
                          Name = "Featured Processes",
                          Tab = TabNames.FeaturedProcesses,
                          Description = "Choose featured processes.")]
        public virtual List<int> FeaturedProcesses { get; set; }

        #endregion

        #region NEWS

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                  OtherTypeName = Constants.CustomDataTypes.MultipleNewsPostPicker,
                  Name = "Featured News",
                  Tab = TabNames.FeaturedNews,
                  Description = "Choose featured news posts.")]
        public virtual List<int> FeaturedNews { get; set; }

        #endregion

        #region TECHNOLOGIES SLIDER

        [DocumentTypeProperty(UmbracoPropertyType.Other,
              OtherTypeName = Constants.CustomDataTypes.MultipleTechnologyPicker,
              Name = "Featured Technologies",
              Tab = TabNames.FeaturedTechnologies,
              Description = "Choose featured technologies.")]
        public virtual List<int> FeaturedTechnologies { get; set; }

        #endregion

        #region TEAM SLIDER

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                  OtherTypeName = Constants.CustomDataTypes.MultipleTeamMemberPicker,
                  Name = "Featured Team Members",
                  Tab = TabNames.FeaturedMembers,
                  Description = "Choose featured team members.")]
        public virtual List<int> FeaturedMembers { get; set; }

        #endregion

        #region TESTIMONIALS

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                 Name = "Title",
                 Tab = TabNames.Testimonials,
                 Description = "Testimonial title.")]
        public virtual string TestimonialTitle { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                   OtherTypeName = Constants.CustomDataTypes.MultipleTestimonialsPicker,
                   Name = "Testimonials",
                   Tab = TabNames.Testimonials,
                   Description = "Choose testimonials.")]
        public virtual List<int> Testimonials { get; set; }

        #endregion

        #region PARTNER NETWORK

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
         Name = "Title",
         Tab = TabNames.PartnerNetwork,
         Description = "Partners network title.")]
        public virtual string PartnersTitle { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
           OtherTypeName = Constants.CustomDataTypes.MultiplePartnerPicker,
           Name = "Partners",
           Tab = TabNames.PartnerNetwork,
           Description = "Choose partner network.")]
        public virtual List<int> PartnerNetwork { get; set; }

        #endregion
    }
}