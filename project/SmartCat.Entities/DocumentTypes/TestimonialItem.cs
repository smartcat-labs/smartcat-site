using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-stickynote.png", Name = "Testimonial", Description = "Testimonial document type.", AllowAtRoot = false)]
    public class TestimonialItem : Main
    {
        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                 Name = "Quote",
                 Tab = TabNames.Content,
                 Description = "Testimonial quote text.")]
        public virtual string TestimonialText { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                 Name = "Author",
                 Tab = TabNames.Content,
                 Description = "Testimonial author.")]
        public virtual string TestimonialAuthor { get; set; }
    }
}
