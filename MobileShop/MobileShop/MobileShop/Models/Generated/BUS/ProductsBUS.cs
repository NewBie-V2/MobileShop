using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileShopConnection;
using PetaPoco;

namespace MobileShop.Models.Generated.BUS
{
    public class ProductsBUS
    {
        public static IEnumerable<Product> DanhSach()
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<Product>("Select * from Product");
            }
        }

        public static Page<Product> DanhSach(int pageNumber, int itemPerPage)
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Page<Product>(pageNumber, itemPerPage, "Select * from Product");
            }
        }
    }
}