<%@ Page Title="Delete" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="BookStoreWebForms.Views.Books.Delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Delete</h2>
    <h3>Are you sure you want to delete this?</h3>
<div>
    <h4>Books</h4>
    <hr />
    <dl class="dl-horizontal">
        <dt>
            Title
        </dt>

        <dd>
            <%: book.Title %>
        </dd>

        <dt>
            Author List
        </dt>

        <dd>
            <%: book.AuthorList %>
        </dd>

        <dt>
            ISBN
        </dt>

        <dd>
            <%: book.Isbn %>
        </dd>

        <dt>
            Publishing Date
        </dt>

        <dd>
            <%: book.PublishingDate.ToString("yyyy-MM-dd") %>
        </dd>

        <dt>
            Publisher
        </dt>

        <dd>
            <%: book.Publishers.Name %>
        </dd>

        <dt>
            Page Count
        </dt>

        <dd>
            <%: book.PageCount %>
        </dd>

        <dt>
            Price
        </dt>

        <dd>
            <%: book.Price %>
        </dd>

        <dt>
            Category
        </dt>

        <dd>
            <%: book.Category.Name %>
        </dd>

    </dl>
</div>
<p>
    <asp:Button CssClass="btn btn-danger" Text="Delete" ID="btnDelete" OnClick="btnDelete_Click" runat="server" />
    <a href="Index" class="btn btn-default">Back To List</a>
</p>
</asp:Content>
