using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileShopConnection;
using PetaPoco;
using System.Transactions;

namespace MobileShop.Models.Generated.BUS
{
    public class ProductsBUS
    {
        public static IEnumerable<Product> DanhSach()
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<Product>("Select * from Product  where Deleted = 0");
            }
        }

        public static Page<Product> DanhSach(int pageNumber, int itemPerPage)
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Page<Product>(pageNumber, itemPerPage, "Select * from Product where Deleted = 0");
            }
        }

        public static object ThemSP(Product sp)
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Insert(sp);
            }
        }

        public static void SuaSP(Product sp)
        {
            using (var db = new MobileShopConnectionDB())
            {
                db.Update("Product", "ProductID", sp);
            }
        }

        public static void Deleted(int id)
        {
            using (TransactionScope tran = new TransactionScope())
            {
                using (var db = new MobileShopConnectionDB())
                {
                    db.Delete("Image", "ImageID", null, id);
                    db.Delete("Product", "ProductID", null, id);
                }
                tran.Complete();
            }
        }

        public static void XoaSP(int id)
        {
            using (TransactionScope tran = new TransactionScope())
            {
                using (var db = new MobileShopConnectionDB())
                {
                    db.Delete("Image", "ImageID", null, id);
                    db.Delete("Product", "ProductID", null, id);
                }
                tran.Complete();
            }
        }

        public static void HideProductByProducer(int producerID)
        {
            using (var db = new MobileShopConnectionDB())
            {
                db.Query<Product>("Update Product Set Deleted=1 Where ProducerID=@0", producerID);
            }
        }
    }
}