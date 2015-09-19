using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-quoteup.png", Name = "Testimonial Container", Description = "Testimonial container document type", AllowedChildNodeTypes = new[] { typeof(TestimonialItem) })]
    public class TestimonialContainer : Main
    {
    }
}
