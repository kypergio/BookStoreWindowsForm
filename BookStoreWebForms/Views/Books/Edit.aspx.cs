using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookStoreWebForms.DAL;

namespace BookStoreWebForms.Views.Books
{
    public partial class Edit : System.Web.UI.Page
    {
        public bookstore db = new bookstore();
        public DAL.Books book;
        protected void Page_Load(object sender, EventArgs e)
        {
            var Id = Page.Request.Params["Id"];
            if(Id == null || Id == "")
                Response.Redirect("Index");

            book = db.Books.Find(int.Parse(Id));
            
            var categories = db.Category.ToList();

            Category.Items.Add(new ListItem { Text = "Select a Category", Value = "" });
            foreach (var category in categories)
            {
                Category.Items.Add(new ListItem { Text = category.Name, Value = category.Id.ToString() });
            }
            
            if (book.Category != null)
                Category.Items.FindByValue(book.CategoryId.ToString()).Selected = true;

            var publishers = db.Publishers.ToList();

            Publisher.Items.Add(new ListItem { Text = "Select a Publisher", Value = "" });
            foreach (var publisher in publishers)
            {
                Publisher.Items.Add(new ListItem { Text = publisher.Name, Value = publisher.Id.ToString() });
            }

            if (book.Publishers != null)
                Publisher.Items.FindByValue(book.PublisherId.ToString()).Selected = true;

            BookTitle.Text = book.Title;
            AuthorList.Text = book.AuthorList;
            Isbn.Text = book.Isbn;
            PageCount.Value = book.PageCount.ToString();
            Price.Text = book.Price.ToString();
            PublishingDate.Value = book.PublishingDate.ToString("yyyy-MM-dd");
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                book.Title = Page.Request.Form[BookTitle.UniqueID];
                book.AuthorList = Page.Request.Form[AuthorList.UniqueID];
                book.CategoryId = int.Parse(Page.Request.Form[Category.UniqueID].ToString());
                book.Isbn = Page.Request.Form[Isbn.UniqueID];
                book.PageCount = int.Parse(Page.Request.Form[PageCount.UniqueID]);
                book.Price = double.Parse(Page.Request.Form[Price.UniqueID]);
                book.PublisherId = int.Parse(Page.Request.Form[Publisher.UniqueID].ToString());
                book.PublishingDate = StringToDatetime(Page.Request.Form[PublishingDate.UniqueID]);

                db.SaveChanges();

                Response.Redirect("Index");
            }
        }
        public DateTime StringToDatetime(string strFecha)
        {
            try
            {
                var fecha = strFecha.Split('-');
                return new DateTime(
                    Convert.ToInt32(fecha[0]),
                    Convert.ToInt32(fecha[1]),
                    Convert.ToInt32(fecha[2]),0,0, 0);
            }
            catch (Exception)
            {

                return DateTime.Now;
            }
        }
    }

}