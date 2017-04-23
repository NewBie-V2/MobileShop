using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MobileShop.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            var product = Models.Generated.BUS.ProductsBUS.DanhSach();
            var data = new Areas.Admin.ViewModels.HomeViewModel();
            foreach(var item in product)
            {
                data.totalSold += item.Sold.GetValueOrDefault();
                data.totalView += item.Viewed.GetValueOrDefault();
                data.totalMoney += item.Sold.GetValueOrDefault() * item.Price.GetValueOrDefault();
            }

            return View(data);
        }
    }
}