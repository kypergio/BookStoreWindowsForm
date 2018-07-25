using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookStoreWebForms.DAL;

namespace BookStoreWebForms.Views.Books
{
    public partial class Create : System.Web.UI.Page
    {
        public bookstore db = new bookstore();
        protected void Page_Load(object sender, EventArgs e)
        {
            var categories = db.Category.ToList();

            Category.Items.Add(new ListItem { Text = "Select a Category", Value = "" });
            foreach (var category in categories)
            {
                Category.Items.Add(new ListItem { Text = category.Name, Value = category.Id.ToString() });
            }

            var publishers = db.Publishers.ToList();

            Publisher.Items.Add(new ListItem { Text = "Select a Publisher", Value = "" });
            foreach (var publisher in publishers)
            {
                Publisher.Items.Add(new ListItem { Text = publisher.Name, Value = publisher.Id.ToString() });
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                var book = new DAL.Books
                {
                    Title = BookTitle.Text,
                    AuthorList = AuthorList.Text,
                    CategoryId = int.Parse(Page.Request.Form[Category.UniqueID].ToString()),
                    Isbn = Isbn.Text,
                    PageCount = int.Parse(PageCount.Value),
                    Price = double.Parse(Price.Text),
                    PublisherId = int.Parse(Page.Request.Form[Publisher.UniqueID].ToString()),
                    PublishingDate = this.StringToDatetime(PublishingDate.Value)
                };

                db.Books.Add(book);
                db.SaveChanges();

                Response.Redirect("Index");
            }
        }
        public DateTime StringToDatetime(string strFecha)
        {
            try
            {
                var fechaDividida = strFecha.Split(' ');
                var hora = fechaDividida[1].Split(':');
                var fecha = fechaDividida[0].Split('-');
                return new DateTime(
                    Convert.ToInt32(fecha[0]),
                    Convert.ToInt32(fecha[1]),
                    Convert.ToInt32(fecha[2]),
                    Convert.ToInt32(hora[0]),
                    Convert.ToInt32(hora[1]), 0);
            }
            catch (Exception)
            {

                return DateTime.Now;
            }
        }
    }

}