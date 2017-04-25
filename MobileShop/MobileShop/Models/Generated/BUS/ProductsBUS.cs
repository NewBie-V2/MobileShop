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

        public static int Deleted(int id)
        {
            int y = -1;
            using (TransactionScope tran = new TransactionScope())
            {
                using (var db = new MobileShopConnectionDB())
                {
                    db.Delete("Image", "ImageID", null, id);
                    y = db.Delete("Product", "ProductID", null, id);
                }
                tran.Complete();
            }
            return y;
        }

        public static int XoaSP(int id)
        {
            int y = -1;
            using (TransactionScope tran = new TransactionScope())
            {
                using (var db = new MobileShopConnectionDB())
                {
                    var x = db.Delete("Image", "ImageID", null, id);
                    y = db.Delete("Product", "ProductID", null, id);
                }
                tran.Complete();
            }
            return y;
        }

        public static void HideProductByProducer(int producerID)
        {
            using (var db = new MobileShopConnectionDB())
            {
                using (TransactionScope tran = new TransactionScope())
                {
                    var p = db.Query<Product>("Select * From Product Where ProducerID=@0", producerID);

                    foreach (var product in p)
                    {
                        product.Deleted = 1;
                        SuaSP(product);
                    }

                    tran.Complete();
                }
                //db.Query<Product>("Update Product Set Deleted=1 Where ProducerID=@0", producerID);
            }
        }
    }
}