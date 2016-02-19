namespace SmartCat.Entities
{
    using Vega.USiteBuilder;

    public enum TabNames
    {
        Page = 1,

        SEO,

        Nodes,

        Content,

        [TabName("Contact us")]
        ContactUs,

        [TabName("Home Banner")]
        HomeBanner,

        [TabName("Featured Services")]
        FeaturedServices,

        [TabName("Featured Technologies")]
        FeaturedTechnologies,

        [TabName("Featured Expertise")]
        FeaturedExpertise,

        [TabName("About Us")]
        AboutUs,

        [TabName("Featured Processes")]
        FeaturedProcesses,

        [TabName("Featured News")]
        FeaturedNews,

        [TabName("Featured Members")]
        FeaturedMembers,

        [TabName("Testimonials")]
        Testimonials,

        [TabName("Partner Network")]
        PartnerNetwork,

        Settings,

        [TabName("Steps Form")]
        StepsForm,

        [TabName("Main Form")]
        MainForm,

        Sidebar,

        [TabName("First Column")]
        FirstColumn,

        [TabName("Second Column")]
        SecondColumn,

        [TabName("Third Column")]
        ThirdColumn,

        [TabName("Social Links")]
        SocialLinks
    }
}