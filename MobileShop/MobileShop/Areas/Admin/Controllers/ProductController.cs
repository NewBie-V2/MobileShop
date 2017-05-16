using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;

namespace MobileShop.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProductController : Controller
    {
        public const int RecordsPerPage = 15;
        public List<Product> ProjectData;

        public ProductController()
        {
            ViewBag.RecordsPerPage = RecordsPerPage;
            ViewBag.Title = "Product list";
        }

        // GET: Admin/Home
        public ActionResult Index(int page=1)
        {
            var products = Models.Generated.BUS.ProductsBUS.DanhSach(page, 10);

            return View(products);
        }

        #region[Create]
        public ActionResult Create()
        {
            ViewBag.producerID = new SelectList(Models.Generated.BUS.ProducersBUS.DanhSach(), "ProducerID", "ProducerName");
            ViewBag.ProductTypeID = new SelectList(Models.Generated.BUS.ProductTypeBUS.DanhSach(), "ProductTypeID", "ProductTypeName");
            var list = new List<SelectListItem>
            {
                new SelectListItem{ Text="1", Value = "1" },
                new SelectListItem{ Text="2", Value = "2" },
                new SelectListItem{ Text="3", Value = "3" },
                new SelectListItem{ Text="4", Value = "4" },
                new SelectListItem{ Text="5", Value = "5" },
            };

            ViewData["Quantity"] = list;


            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Product product)
        {
            var msg = "";
            var icon = "ban";
            var x = "danger";
            
            if (ModelState.IsValid)
            {
                try
                {
                    using (TransactionScope tran = new TransactionScope())
                    {
                        product.Sold = 0;
                        product.Viewed = 0;
                        product.Date = Convert.ToDateTime(DateTime.Now.ToString());
                        product.Deleted = 0;
                        product.ImageURL = "notfound.png";
                        var id = (int)Models.Generated.BUS.ProductsBUS.ThemSP(product);

                        if (Request.Files.Count > 0)
                        {
                            for (int i = 0; i < Request.Files.Count; i++)
                            {
                                var file = Request.Files[i];
                                if (file != null && file.ContentLength > 0)
                                {
                                    var fileName = Path.GetFileName(file.FileName);
                                    var extention = Path.GetExtension(file.FileName).ToString();
                                    var fileNameSave = "product-" + id.ToString() + "-" + new Random().Next().ToString() + extention;
                                    var path = Path.Combine(Server.MapPath("~/Assets/Users/img/"), fileNameSave);
                                    file.SaveAs(path);
                                    Models.Generated.BUS.ImageBUS.Insert(new Image { ImageURL = fileNameSave, ProductID = id });
                                }
                            }
                        }
                        tran.Complete();
                        msg = "Create successful!";
                        icon = "check";
                        x = "success";
                    }
                }
                catch (TransactionAbortedException ex)
                {
                    msg = "Something went wrong: " + ex.Message;
                }
                catch(Exception ex)
                {
                    msg = ex.Message;
                }

                TempData["msg"] = msg;
                TempData["icon"] = icon;
                TempData["x"] = x;
                return RedirectToAction("Create", "Product");
            }

            return View("Create", "Product");
        }
        #endregion

        #region[Delete]
        public ActionResult Delete(int id)
        {
            var msg = "Not found!";
            var icon = "ban";
            var x = "danger";

            try
            {
                if (Models.Generated.BUS.ProductsBUS.XoaSP(id) > 0)
                {
                    msg = "Deleted";
                    icon = "check";
                    x = "success";
                }
            }
            catch(Exception ex)
            {
                msg = "Something wrong: " + ex.Message;
            }

            TempData["msg"] = msg;
            TempData["icon"] = icon;
            TempData["x"] = x;
            return RedirectToAction("Index", "Product");
        }
        #endregion

        #region[Edit]
        public ActionResult Edit(int id)
        {

            var temp = Models.Generated.BUS.ProductsBUS.DanhSach().Where(p => p.ProductID == id);

            if (temp.Any())
            {
                var product = temp.FirstOrDefault();

                ViewBag.data = product;
                ViewBag.producerID = new SelectList(Models.Generated.BUS.ProducersBUS.DanhSach(), "ProducerID", "ProducerName", product.ProducerID);
                ViewBag.ProductTypeID = new SelectList(Models.Generated.BUS.ProductTypeBUS.DanhSach(), "ProductTypeID", "ProductTypeName", product.ProductTypeID);
                var list = new List<SelectListItem>
                {
                    new SelectListItem{ Text="1", Value = "1" },
                    new SelectListItem{ Text="2", Value = "2" },
                    new SelectListItem{ Text="3", Value = "3" },
                    new SelectListItem{ Text="4", Value = "4" },
                    new SelectListItem{ Text="5", Value = "5" },
                };

                ViewData["Quantity"] = list;

                return View(product);
            }

            TempData["msg"] = "Not found!";
            TempData["icon"] = "ban";
            TempData["x"] = "danger";
            return RedirectToAction("Index", "Product");
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product product)
        {
            var msg = "";
            var icon = "ban";
            var x = "danger";
            try
            {
                Models.Generated.BUS.ProductsBUS.SuaSP(product);

                msg = "Successful edit!";
                icon = "check";
                x = "success";
            }
            catch(Exception ex)
            {
                msg = "Sonething went wrong: " + ex.Message;
            }

            TempData["msg"] = msg;
            TempData["icon"] = icon;
            TempData["x"] = x;
            return RedirectToAction("Index", "Product");
        }
        #endregion

        #region[Image]
        public ActionResult ImageEdit(int id)
        {
            var data = Models.Generated.BUS.ImageBUS.DanhSach(id);

            if (data.Any())
            {
                return View(data);
            }

            TempData["msg"] = "Not found!";
            TempData["icon"] = "ban";
            TempData["x"] = "danger";
            return RedirectToAction("Index", "Product");
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult ImageEdit(Image img, FormCollection collection)
        {
            
            int productID = int.Parse(collection["productID"]);
            using (TransactionScope tran = new TransactionScope())
            {
                if (Request.Files.Count > 0)
                {
                    for (int i = 0; i < Request.Files.Count; i++)
                    {
                        var file = Request.Files[i];
                        if (file != null && file.ContentLength > 0)
                        {
                            var fileName = Path.GetFileName(file.FileName);
                            var extention = Path.GetExtension(file.FileName).ToString();
                            var fileNameSave = "product-" + productID + "-" + new Random().Next().ToString() + extention;
                            var path = Path.Combine(Server.MapPath("~/Assets/Users/img/"), fileNameSave);
                            file.SaveAs(path);
                            img.ImageURL = fileNameSave;
                            Models.Generated.BUS.ImageBUS.Insert(img);
                        }
                    }
                }

                tran.Complete();
            }
            return RedirectToAction("ImageEdit", new System.Web.Routing.RouteValueDictionary(new { controller="Product", action="ImageEdit", id=productID}));
        }



        public ActionResult ImageDelete(int id)
        {
            var productID = Models.Generated.BUS.ImageBUS.DanhSach().Where(p => p.ImageID == id).Select(p => p.ProductID).FirstOrDefault();
            Models.Generated.BUS.ImageBUS.Delete(id);

            if (ModelState.IsValid)
            {
                return RedirectToAction("ImageEdit", new System.Web.Routing.RouteValueDictionary(new { controller = "Product", action = "ImageEdit", id = productID }));
            }
            return RedirectToAction("Index");
        }
        #endregion
    }
}