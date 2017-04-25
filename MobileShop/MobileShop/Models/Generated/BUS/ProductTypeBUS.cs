using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileShop.Models.Generated.BUS
{
    public class ProductTypeBUS
    {
        public static IEnumerable<ProductType> DanhSach()
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<ProductType>("Select * from ProductType where Deleted = 0");
            }
        }

        public static int idProductType(string productTypeName)
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<ProductType>("Select * from ProductType where Deleted = 0 and ProductTypeName=@0", productTypeName).FirstOrDefault().ProductTypeID;
            }
        }
    }
}