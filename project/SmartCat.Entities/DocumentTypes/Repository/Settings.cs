using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes.Repository
{
    [DocumentType(IconUrl = "icon-cog.png", Name = "Settings", Description = "For defining initial settings.", AllowAtRoot = false)]
    public class Settings : Repository
    {
        #region PAGES

        #endregion

        #region NODES

        #endregion

        #region SETTINGS

        [DocumentTypeProperty(UmbracoPropertyType.ContentPicker,
                             Tab = TabNames.Nodes,
                             Name = "Header",
                             Description = "Header.",
                             Mandatory = true)]
        public virtual int? Header { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.ContentPicker,
                              Tab = TabNames.Nodes,
                              Name = "Footer",
                              Description = "Footer.",
                              Mandatory = true)]
        public virtual int? Footer { get; set; }

        #endregion
    }

}
