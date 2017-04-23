using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MobileShop.Areas.Admin.Controllers
{
    public class ProducerController : Controller
    {
        // GET: Admin/Producer
        public ActionResult Index(int page=1)
        {
            ViewBag.Title = "Producer list";
            var producers = MobileShop.Models.Generated.BUS.ProducersBUS.DanhSach(page, 10);

            return View(producers);
        }

        public ActionResult Delete(int id)
        {
            Models.Generated.BUS.ProducersBUS.HideProducer(id);
            return RedirectToAction("Index");
        }
    }
}