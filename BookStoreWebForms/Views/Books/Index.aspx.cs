using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookStoreWebForms.DAL;

namespace BookStoreWebForms.Views.Books
{
    public partial class Index : System.Web.UI.Page
    {
        public bookstore db = new bookstore();
        public List<Book> books;
        protected void Page_Load(object sender, EventArgs e)
        {
            var categories = db.Category.ToList();

            Category.Items.Add(new ListItem { Text = "Select a Category", Value = "" });
            foreach (var category in categories)
            {
                Category.Items.Add(new ListItem { Text = category.Name, Value = category.Id.ToString() });
            }

            if (Request.Form[Category.UniqueID] != null)
            {
                Category.Items.FindByValue(Request.Form[Category.UniqueID].ToString()).Selected = true;
            }
            books = db.Books.Select(c => new Book
            {
                Title = c.Title,
                AuthorList = c.AuthorList,
                CategoryId = c.CategoryId,
                Category = c.Category.Name,
                Id = c.Id,
                Isbn = c.Isbn,
                PageCount = c.PageCount,
                Price = c.Price,
                Publisher = c.Publishers.Name,
                PublishingDate_ = c.PublishingDate
            }).ToList();

            if (Request.Form[BookTitle.UniqueID] != null)
            {
                if (Request.Form[BookTitle.UniqueID].ToString() != "")
                {
                    books = books.Where(c => c.Title == Request.Form[BookTitle.UniqueID].ToString()).ToList();
                    BookTitle.Value = Request.Form[BookTitle.UniqueID].ToString();
                }
                
            }
            if (Request.Form[Price.UniqueID] != null)
            {
                if (Request.Form[Price.UniqueID].ToString() != "")
                {
                    books = books.Where(c => c.Price >= int.Parse(Request.Form[Price.UniqueID].ToString())).ToList();
                    Price.Value = Request.Form[Price.UniqueID].ToString();
                }
            }
            if (Request.Form[Category.UniqueID] != null)
            {
                if (Request.Form[Category.UniqueID].ToString() != "")
                    books = books.Where(c => c.CategoryId == int.Parse(Request.Form[Category.UniqueID].ToString())).ToList();
            }
        }
    }
}