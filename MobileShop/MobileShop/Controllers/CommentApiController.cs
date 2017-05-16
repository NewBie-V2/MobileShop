using Microsoft.AspNet.Identity;
using MobileShop.Models.Generated.BUS;
using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MobileShop.Controllers
{
    public class CommentApiController : ApiController
    {
        // GET: api/CommentApi
        public List<Models.CommentModels> Get(int id)
        {
            var data = CommentBUS.GetCommentByProductID(id);
            
            return CommentBUS.GetCommentByProductID(id);
        }

        //// GET: api/CommentApi/5
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST: api/CommentApi
        public void Post([FromBody]Comment cmt)
        {
            CommentBUS.AddComment(cmt.ProductID ?? default(int), User.Identity.GetUserId(), cmt.Value);
        }

        // PUT: api/CommentApi/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/CommentApi/5
        public void Delete(int id)
        {
        }
    }
}
