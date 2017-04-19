using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MobileShop.Controllers
{
    public class ShopingCartController : Controller
    {
        // GET: Cart
        public ActionResult Cart()
        {
            return View();
        }
    }
}