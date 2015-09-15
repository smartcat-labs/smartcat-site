using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RJP.MultiUrlPicker.Models;

namespace SmartCat.Entities.DataTypes
{
    public class UrlPicker
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public string Target { get; set; }
        public LinkType LinkType { get; set; }
    }
}
