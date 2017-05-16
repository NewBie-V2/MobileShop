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
    public class ProducerController : Controller
    {
        // GET: Admin/Producer
        public ActionResult Index(int page=1)
        {
            ViewBag.Title = "Producer list";
            var producers = MobileShop.Models.Generated.BUS.ProducersBUS.DanhSach(page, 10);

            return View(producers);
        }

        #region[Create]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MobileShopConnection.Producer producer)
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
                        producer.Deleted = 0;

                        if (Request.Files.Count > 0)
                        {
                            var file = Request.Files[0];
                            if (file != null && file.ContentLength > 0)
                            {
                                var path = Path.GetFileName(file.FileName);
                                var extention = Path.GetExtension(file.FileName).ToString();
                                var newName = "logo-" + producer.ProducerName + "-" + new Random().Next().ToString() + extention;
                                var savePath = Path.Combine(Server.MapPath("~/Assets/Users/img/"), newName);
                                file.SaveAs(savePath);
                                producer.LoGo = newName;
                            }
                        }

                        int z = 0;
                        if (int.TryParse(Models.Generated.BUS.ProducersBUS.Them(producer).ToString(), out z))
                        {
                            tran.Complete();
                            msg = "Success";
                            icon = "check";
                            x = "success";
                        }
                        else
                        {
                            tran.Dispose();
                        }
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
            }
            
            TempData["msg"] = msg;
            TempData["icon"] = icon;
            TempData["x"] = x;
            return RedirectToAction("Create", "Producer");
        }
        #endregion

        #region [Delete]
        public ActionResult Delete(int id)
        {
            var msg = "";
            var icon = "ban";
            var x = "danger";

            try
            {
                Models.Generated.BUS.ProducersBUS.HideProducer(id);
                msg = "Success";
                icon = "check";
                x = "success";
            }
            catch (Exception ex)
            {
                msg = ex.Message;
            }


            TempData["msg"] = msg;
            TempData["icon"] = icon;
            TempData["x"] = x;
            return RedirectToAction("Index", "Producer");
        }
        #endregion

        #region[Edit]
        public ActionResult Edit(int id)
        {
            var temp = Models.Generated.BUS.ProducersBUS.DanhSach().Where(p=>p.ProducerID==id);

            if (temp.Any())
            {
                var data = temp.FirstOrDefault();

                return View(data);
            }

            TempData["msg"] = "Not found!";
            TempData["icon"] = "ban";
            TempData["x"] = "danger";
            return RedirectToAction("Index", "Producer");
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Producer producer)
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
                        if (Request.Files.Count > 0)
                        {
                            var file = Request.Files[0];
                            if (file != null && file.ContentLength > 0)
                            {
                                var path = Path.GetFileName(file.FileName);
                                var extention = Path.GetExtension(file.FileName).ToString();
                                var newName = "logo-"+ producer.ProducerName + "-" + new Random().Next().ToString() + extention;
                                var savePath = Path.Combine(Server.MapPath("~/Assets/Users/img/"), newName);
                                file.SaveAs(savePath);
                                producer.LoGo = newName;
                                producer.Deleted = 0;
                            }
                        }

                        Models.Generated.BUS.ProducersBUS.Sua(producer);
                        tran.Complete();
                        msg = "Success";
                        icon = "check";
                        x = "success";
                    }
                }
                catch (TransactionAbortedException ex)
                {
                    msg = "Something went wrong: " + ex.Message;
                }
                catch (Exception ex)
                {
                    msg = ex.Message;
                }
            }

            TempData["msg"] = msg;
            TempData["icon"] = icon;
            TempData["x"] = x;
            return RedirectToAction("Index", "Producer");
        }
        #endregion
    }
}