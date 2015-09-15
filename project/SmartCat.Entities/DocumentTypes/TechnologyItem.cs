using SmartCat.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-database.png", Name = "Technology Item", Description = "Technology item document type.", AllowAtRoot = false)]
    public class TechnologyItem : Main
    {
        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Technology Image",
                           Tab = TabNames.Content,
                           Description = "Technology image. Dimensions are 115x76 px.")]
        public virtual int? TechnologyImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                          Name = "Technology description",
                          Tab = TabNames.Content,
                          Description = "Short description about technology.")]
        public virtual string TechnologyDescription { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.TeamMemberPicker,
                          Name = "Contact Member",
                          Mandatory = true,
                          Tab = TabNames.Content,
                          Description = "Choose team member for this technology.")]
        public virtual int? MemberContact { get; set; }
    }
}
