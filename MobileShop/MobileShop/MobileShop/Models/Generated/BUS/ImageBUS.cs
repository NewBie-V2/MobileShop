using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileShop.Models.Generated.BUS
{
    public class ImageBUS
    {
        public static IEnumerable<Image> DanhSach(int productID)
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<Image>("Select * from Image  where ImageID=@0", productID);
            }
        }

        public static void Delete(int productID)
        {
            using (var db = new MobileShopConnectionDB())
            {
                db.Delete("Image", "ImageID", null, productID);
            }
        }

        public static void Insert(Image img)
        {
            using (var db = new MobileShopConnectionDB())
            {
                db.Insert("Image", "ImageID", img);
            }
        }

        public  static void Update (Image img)
        {
            using (var db = new MobileShopConnectionDB())
            {
                db.Update("Image", "ImageID", img);
            }
        }
    }
}