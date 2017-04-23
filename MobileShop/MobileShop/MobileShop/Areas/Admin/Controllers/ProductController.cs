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
            //return RedirectToAction("GetProjects");
        }

        #region[Lazy loading]
        public ActionResult GetProjects(int? pageNum)
        {
            pageNum = pageNum ?? 0;
            ViewBag.IsEndOfRecords = false;
            if (Request.IsAjaxRequest())
            {
                var projects = GetRecordsForPage(pageNum.Value);
                ViewBag.IsEndOfRecords = (projects.Any());
                return PartialView("_Product", projects);
            }
            else
            {
                ProjectData = Models.Generated.BUS.ProductsBUS.DanhSach().ToList();

                ViewBag.TotalNumberProjects = ProjectData.Count;
                ViewBag.Projects = GetRecordsForPage(pageNum.Value);

                return View("Index");
            }
        }

        public List<Product> GetRecordsForPage(int pageNum)
        {
            ProjectData = Models.Generated.BUS.ProductsBUS.DanhSach().ToList();

            int from = (pageNum * RecordsPerPage);

            var tempList = (from rec in ProjectData
                            select rec).Skip(from).Take(15).ToList();

            return tempList;
        }
        #endregion

        #region[Create]
        public ActionResult Create()
        {
            ViewBag.producersID = new SelectList(Models.Generated.BUS.ProducersBUS.DanhSach(), "ProducerID", "ProducerName");
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
            if (ModelState.IsValid)
            {
                using (TransactionScope tran = new TransactionScope())
                {
                    product.Sold = 0;
                    product.Viewed = 0;
                    product.Date = Convert.ToDateTime(DateTime.Now.ToString());
                    product.Deleted = 0;
                    product.ImageURL = "notfound.png";
                    var id = (int)Models.Generated.BUS.ProductsBUS.ThemSP(product);
                
                    if(Request.Files.Count > 0)
                    {
                        for(int i = 0; i< 3; i++)
                        {
                            var file = Request.Files[i];
                            if(file != null && file.ContentLength > 0)
                            {
                                var fileName = Path.GetFileName(file.FileName);
                                var path = Path.Combine(Server.MapPath("~/Assets/Users/img/"), fileName);
                                file.SaveAs(path);
                                Models.Generated.BUS.ImageBUS.Insert(new Image { ImageURL=fileName, ProductID=id});
                            }
                        }
                    }
                    tran.Complete();
                }
                     
                return RedirectToAction("Index", "Product");
            }

            return View("Create", "Product");
        }
        #endregion

        #region[Delete]
        public ActionResult Delete(int id)
        {
            Models.Generated.BUS.ProductsBUS.XoaSP(id);

            return RedirectToAction("Index", "Product");
        }
        #endregion

        #region[Update]
        public ActionResult Update(Product product)
        {
            Models.Generated.BUS.ProductsBUS.SuaSP(product);

            return RedirectToAction("Index", "Product");
        }
        #endregion
    }
}