using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities
{
    public enum TabNames
    {
        Page = 1,

        Nodes,

        Content,

        [TabName("Contact us")]
        ContactUs,

        SEO,

        Settings,

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
