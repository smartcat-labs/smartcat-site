using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-databaseadd.png", Name = "Service Item", Description = "Service item document type", AllowAtRoot = false)]
    public class ServiceItem : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Image",
                           Tab = TabNames.Content,
                           Description = "Service image.")]
        public virtual int? ServiceImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Title Image",
                           Tab = TabNames.Content,
                           Description = "Service title image.")]
        public virtual int? ServiceTitleImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
                            Alias = "rteContent",
                            Name = "Main body",
                            Description = "Define main content using RTE.",
                            Tab = TabNames.Content)]
        public virtual string ServiceContent { get; set; }
    }
}
