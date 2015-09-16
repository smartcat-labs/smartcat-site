using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-check.png", Name = "Process Item", Description = "Process item document type.", AllowAtRoot = false)]
    public class ProcessItem : Main
    {
        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                          Name = "Process Image",
                          Tab = TabNames.Content,
                          Description = "Process image. Dimensions are 195x195 px.")]
        public virtual int? ProcessImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                        Name = "Process Description.",
                        Tab = TabNames.Content,
                        Description = "Process description text.")]
        public virtual string ProcessDescription { get; set; }
    }
}
