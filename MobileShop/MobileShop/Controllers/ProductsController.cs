using MobileShop.Models.Generated.BUS;
using MobileShop.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;

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
            var cmt = CommentBUS.GetCommentByProductID(id);

            if (!image.Any())
            {
                image = new MobileShopConnection.Image[] { new MobileShopConnection.Image { ImageURL = "notfound.png" } };
            }

            var detail = (from prod in product
                          join prodc in producer on prod.ProducerID equals prodc.ProducerID into groups
                          from y in groups.DefaultIfEmpty()
                          join prodd in productDetail on prod.ProductID equals prodd.ProductID into groups1
                          from x in groups1.DefaultIfEmpty()
                          where prod.ProductID == id
                          select new DetailViewModel { Producer = y.ProducerName, Products = prod, ProductDetails = x, images = image, comments = cmt });
    
            return View(detail);
        }

        public ActionResult AllProduct(int page=1)
        {
            MobileShop.ViewModels.AllProductViewModel data = new MobileShop.ViewModels.AllProductViewModel();
            data.product = ProductsBUS.DanhSach(page, 8);
            var products = ProductsBUS.DanhSach(page, 8);

            return View(products);
        }

        [Authorize]
        [HttpPost]
        public ActionResult Comments(int MaSanPham, String NoiDung)
        {
            CommentBUS.AddComment(MaSanPham, User.Identity.GetUserId(), NoiDung);
            return RedirectToAction("Details", "Products", new { id = MaSanPham});
        }
    }
}