using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileShop.ViewModels
{
    public class DetailViewModel
    {
        public MobileShopConnection.Product Products { get; set; }

        public MobileShopConnection.ProductDetail ProductDetails { get; set; }

        public string Producer { get; set; }

        public IEnumerable<MobileShopConnection.Image> images { get; set; }
    }
}