using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MobileShop.Models.Generated.BUS;
using MobileShop.ViewModels;

namespace MobileShop.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var product = ProductsBUS.DanhSach();
            var producer = ProducersBUS.DanhSach();
            var viewModel = from p in product
                            join pc in producer
                            on p.ProducerID equals pc.ProducerID
                            select new HomeViewModel { Products = p, Producers = pc };

            return View(viewModel);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}