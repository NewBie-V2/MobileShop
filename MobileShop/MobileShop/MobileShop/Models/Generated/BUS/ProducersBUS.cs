﻿using System;
using System.Collections.Generic;
using System.Linq;
using MobileShopConnection;
using PetaPoco;
using System.Transactions;

namespace MobileShop.Models.Generated.BUS
{
    public class ProducersBUS
    {
        public static IEnumerable<Producer> DanhSach()
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<Producer>("Select * from Producer where Deleted = 0");
            }
        }

        public static Page<Producer> DanhSach(int pageNumber, int itemPerPage)
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Page<Producer>(pageNumber, itemPerPage, "Select * from Producer where Deleted = 0");
            }
        }
        
        public static List<String> DanhSachTenProducer()
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<Producer>("Select * from Producer where Deleted = 0").Select(p => p.ProducerName).ToList();
            }
        }

        public static int idProducer(string producerName)
        {
            using (var db = new MobileShopConnectionDB())
            {
                return db.Query<Producer>("Select * from Producer where Deleted = 0 and producerName=@0", producerName).FirstOrDefault().ProducerID;
            }
        }

        public static void Them(Producer producer)
        {
            using (var db = new MobileShopConnectionDB())
            {
                db.Insert(producer);
            }
        }

        public static void Sua(Producer producer)
        {
            using (var db = new MobileShopConnectionDB())
            {
                db.Update("Producer", "ProducerID", null, producer);
            }
        }

        public static void HideProducer(int id)
        {
            using (TransactionScope tran = new TransactionScope())
            {
                using (var db = new MobileShopConnectionDB())
                {
                    ProductsBUS.HideProductByProducer(id);
                    db.Query<Producer>("Update Producer Set Deleted=1 Where ProducerID=@0", id);
                }
                tran.Complete();
            }
        }
    }
}