using MobileShop.Models.Generated.BUS;
using MobileShop.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MobileShop.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        public ActionResult Details(int id)
        {
            var product = ProductsBUS.DanhSach();
            var productDetail = ProductDetailBUS.DanhSach();
            var producer = ProducersBUS.DanhSach();
            var image = ImageBUS.DanhSach(id);

            //var detail = from p in product
            //             join pc in producer on p.ProducerID equals pc.ProducerID
            //             join c in productDetail on p.ProductID equals c.ProductID
            //             where p.ProductID == id
            //             select new DetailViewModel { Producer = pc.ProducerName, ProductDetails = c, Products = p };

            var detail = (from prod in product
                          join prodc in producer on prod.ProducerID equals prodc.ProducerID into groups
                          from y in groups.DefaultIfEmpty()
                          join prodd in productDetail on prod.ProductID equals prodd.ProductID into groups1
                          from x in groups1.DefaultIfEmpty()
                          where prod.ProductID == id
                          select new DetailViewModel { Producer = y.ProducerName, Products = prod, ProductDetails = x, images = image});
            
            return View(detail);
        }

        public ActionResult AllProduct(int page=1)
        {
            var products = ProductsBUS.DanhSach(page, 8);

            return View(products);
        }
    }
}