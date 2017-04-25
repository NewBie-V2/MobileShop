using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileShop.ViewModels
{
    public class AllProductViewModel
    {
        public PetaPoco.Page<MobileShopConnection.Product> product;

        public string img;
    }
}