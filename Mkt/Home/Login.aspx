<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Mkt.Home.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Liverpool</h2>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <table style="width: 100%;">
        <tr >
            <td class="span1"><asp:Label ID="lblUsuario" runat="server" Text="Usuário: "></asp:Label></td>
            <td><asp:TextBox ID="TextBoxUsuario" runat="server"></asp:TextBox></td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBoxUsuario" runat="server" ErrorMessage="Usúario deve ser preenchido."></asp:RequiredFieldValidator>
        </tr>
        <tr >
            <td class="span1"><asp:Label ID="lblSenha" runat="server" Text="  Senha: "></asp:Label></td>
            <td><asp:TextBox ID="TextBoxSenha" TextMode="Password" runat="server"></asp:TextBox></td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBoxSenha" runat="server" ErrorMessage="Senha deve ser preenchido."></asp:RequiredFieldValidator>
        </tr>
    </table>

    <div class="control-group">
        <br />
        <div class="row-fluid">
            <div class="span2">
                <asp:LinkButton ID="InsertButton" runat="server" OnClick="InsertButton_Click" CausesValidation="True" CommandName="Insert" Style="margin-right: 20px;" CssClass="btn btn-info btn-block"><i class="icon icon-user icon-white"></i> Entrar</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
