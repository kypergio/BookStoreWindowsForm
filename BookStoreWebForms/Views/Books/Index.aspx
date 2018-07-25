<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BookStoreWebForms.Views.Books.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Index</h2>

    <p>
        <a href="Create" class="btn btn-primary">Create</a>
    </p>
    <div class="row">
        <div class="col-sm-3">
            <input type="text" id="BookTitle" runat="server" class="form-control" placeholder="Enter Title" />
        </div>
        <div class="col-sm-3">
            <input type="number" id="Price" runat="server" class="form-control" placeholder="Enter Price" />
        </div>
        <div class="col-sm-3">
            <select id="Category" runat="server" class="form-control"></select>
        </div>
        <div class="col-sm-3">
            <asp:Button CssClass="btn btn-default btn-block" Text="Search" runat="server" ID="btnSearch" OnClick="Page_Load" />
        </div>
   </div>
    <br />
    <table class="table">
        <tr>
            <th>Title
            </th>
            <th>Author List
            </th>
            <th>ISBN
            </th>
            <th>Publishing Date
            </th>
            <th>Publishier
            </th>
            <th>Page Count
            </th>
            <th>Price
            </th>
            <th>Category
            </th>
            <th></th>
        </tr>

        <% foreach (var book in books)
            { %>
        <tr>
            <td>
                <%: book.Title %>
            </td>
            <td>
                <%: book.AuthorList %>
            </td>
            <td>
                <%: book.Isbn %>
            </td>
            <td>
                <%: book.PublishingDate %>
            </td>
            <td>
                <%: book.Publisher %>
            </td>
            <td>
                <%: book.PageCount %>
            </td>
            <td>
                <%: book.Price %>
            </td>
            <td>
                <%: book.Category %>
            </td>
            <td>
                <a href="/Views/Books/Edit?Id=<%: book.Id %>" class="btn btn-warning">Edit</a>
                <a href="/Views/Books/Details?Id=<%: book.Id %>" class="btn btn-info">Details</a>
                <a href="/Views/Books/Delete?Id=<%: book.Id %>" class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <%} %>
    </table>
</asp:Content>
