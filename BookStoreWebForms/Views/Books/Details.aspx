<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="BookStoreWebForms.Views.Books.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Details</h2>

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
    <a href="Edit?Id=<%: Page.Request.Params["Id"] %>" class="btn btn-warning">Edit</a>
    <a href="Index" class="btn btn-default">Back To List</a>
</p>
</asp:Content>
