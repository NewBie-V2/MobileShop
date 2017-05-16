using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileShop.Models.Generated.BUS
{
    public class CommentBUS
    {
        public static List<CommentModels> GetCommentByProductID(int productID)
        {
            using(var db = new MobileShopConnectionDB())
            {
                var data =  db.Fetch<dynamic>(";EXEC usp_GetCommentByProductID @@productId=@0", productID);
                List<CommentModels> lst = new List<CommentModels>();

                foreach (var item in data)
                {
                    CommentModels c = new Models.CommentModels();
                    foreach(var x in item)
                    {
                        if (x.Key == "UserName")
                        {
                            c.UserName = x.Value;
                        }
                        if (x.Key == "Date")
                        {
                            var total = (DateTime.Now - (DateTime)x.Value);
                            var day = total.Days;
                            var hour = total.Hours;
                            var min = total.Minutes;
                            string a = "";

                            if (day == 0)
                            {
                                if (hour == 0)
                                {
                                    if (min == 0)
                                    {
                                        a = "Just now";
                                    }
                                    else
                                    {
                                        a = min + " minutes ago";
                                    }
                                }
                                else
                                {
                                    a = hour + " hours ago";
                                }
                            }
                            else
                            {
                                a = day + " days ago";
                            }
                            c.TimeElapse = a;
                        }
                        if (x.Key == "Value")
                        {
                            c.Value = x.Value;
                        }
                    }
                    lst.Add(c);
                }

                return lst;
            }
        }

        public static int AddComment(int productID, string userID, string comment)
        {
            using (var db = new MobileShopConnectionDB())
            {
                Comment cmt = new Comment()
                {
                    ProductID = productID,
                    UserID = userID,
                    Value = comment,
                    Date = DateTime.Now
                };
                return (int)db.Insert(cmt);
            }
        }
    
    }
}