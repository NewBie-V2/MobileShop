using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileShop.ViewModels
{
    public class HomeViewModel
    {
        public MobileShopConnection.Product Products { get; set; }

        public MobileShopConnection.Producer Producers { get; set; }
    }
}