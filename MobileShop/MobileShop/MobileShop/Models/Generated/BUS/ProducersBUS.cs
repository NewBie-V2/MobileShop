using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileShopConnection;

namespace MobileShop.Models.Generated.BUS
{
    public class ProducersBUS
    {
        public static IEnumerable<Producer> DanhSach()
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<Producer>("Select * from Producer");
            }
        }
    }
}