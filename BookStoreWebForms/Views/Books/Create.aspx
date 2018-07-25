<%@ Page Title="Create" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="BookStoreWebForms.Views.Books.Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create</h2>
    <div class="form-horizontal">
        <h4>Books</h4>
        <hr />
        <div class="form-group">
            <label class="control-label col-md-2">Title</label>
            <div class="col-md-10">
                <asp:TextBox runat="server" CssClass="form-control" ID="BookTitle"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredBookTitle" ControlToValidate="BookTitle"
                    ErrorMessage="Title is Required" runat="server"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">Author List</label>
            <div class="col-md-10">
                <asp:TextBox runat="server" CssClass="form-control" ID="AuthorList"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="AuthorList"
                    ErrorMessage="Author List is Required" runat="server"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">ISBN</label>
            <div class="col-md-10">
                <asp:TextBox runat="server" CssClass="form-control" ID="Isbn"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Isbn"
                    ErrorMessage="ISBN is Required" runat="server"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Publishing Date</label>
            <div class="col-md-10">
                <input type="date" id="PublishingDate" runat="server" class="form-control" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="PublishingDate"
                    ErrorMessage="Date is Required" runat="server"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Publisher</label>
            <div class="col-md-10">
                <select id="Publisher" class="form-control" runat="server"></select>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Publisher"
                    ErrorMessage="Publisher is Required" runat="server"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">Category</label>
            <div class="col-md-10">
                <select id="Category" class="form-control" runat="server"></select>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Category"
                    ErrorMessage="Category is Required" runat="server"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">Page Count</label>
            <div class="col-md-10">
                <input type="number" id="PageCount" runat="server" class="form-control" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="PageCount"
                    ErrorMessage="Page Count is Required" runat="server"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">Price</label>
            <div class="col-md-10">
                <asp:TextBox runat="server" CssClass="form-control" ID="Price"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="Price"
                    ErrorMessage="Price is Required" runat="server"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button Text="Create" CssClass="btn btn-default" runat="server" ID="btnCreate" OnClick="btnCreate_Click" />
                <%--<input type="submit" value="Create" class="btn btn-default" />--%>
            </div>
        </div>
    </div>
    <div>
        <a href="Index">Back To List</a>
    </div>
    <script>
        $(function () {
            $("#MainContent_PublishingDate").on("focusout", function () {
                var value = $(this).val();
                if (value == "") return;

                var date = moment(value);
                var today = moment();

                if (today.isBefore(date)) {
                    $(this).focus();
                    $(this).val("");
                }
            });
        });
    </script>
</asp:Content>
