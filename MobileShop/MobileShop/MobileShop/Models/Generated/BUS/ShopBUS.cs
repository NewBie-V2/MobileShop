using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileShopConnection;

namespace MobileShop.Models.Generated.BUS
{
    public class ShopBUS
    {
        public static IEnumerable<Product> DanhSach()
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<Product>("Select * From Product");
            }
        }
    }
}