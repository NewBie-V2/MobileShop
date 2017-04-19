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

            //var detail = from p in product
            //             join d in productDetail
            //             on p.ProducerID equals d.ProductID
            //             where p.ProducerID == id
            //             select new DetailViewModel { Products = p, ProductDetails = d };
            var detail = from p in product
                         join pc in producer on p.ProducerID equals pc.ProducerID
                         join c in productDetail on p.ProductID equals c.ProductID
                         where p.ProductID == id
                         select new DetailViewModel { Producer = pc.ProducerName, ProductDetails = c, Products = p };

            return View(detail);
        }

        public ActionResult AllProduct()
        {
            var products = ProductsBUS.DanhSach();

            return View(products);
        }
    }
}