﻿namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-buttonb.png",
        Name = "Blog Container",
        Description = "Blog container document type.",
        AllowAtRoot = false,
        AllowedChildNodeTypes = new[]
        {
            typeof(BlogPost),
            typeof(BlogContainer)
        })]
    public class Blog : Page
    {

    }
}