using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileShopConnection;

namespace MobileShop.Models.Generated.BUS
{
    public class ProductDetailBUS
    {
        public static IEnumerable<ProductDetail> DanhSach()
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<ProductDetail>("Select * From ProductDetail");
            }
        }
    }
}