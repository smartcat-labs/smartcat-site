using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-contact-businesscard.png", Name = "Contact", Description = "Contact document type.", AllowAtRoot = false)]
    public class Contact : Page
    {

    }
}
