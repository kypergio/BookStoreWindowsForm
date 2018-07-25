using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookStoreWebForms.DAL;

namespace BookStoreWebForms.Views.Books
{
    public partial class Delete : System.Web.UI.Page
    {
        private bookstore db = new bookstore();
        public DAL.Books book;
        protected void Page_Load(object sender, EventArgs e)
        {
            var Id = Page.Request.Params["Id"];

            if (Id == null || Id == "")
                Response.Redirect("Index");

            book = db.Books.Find(int.Parse(Id));
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            db.Books.Remove(book);
            db.SaveChanges();
            Response.Redirect("Index");
        }
    }
}