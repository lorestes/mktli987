<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Adicionar.aspx.cs" Inherits="Mkt.Usuarios.Adicionar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/jquery.mask.min.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <script type="text/javascript">
        $(function () {

        });
    </script>
    <h2>Cadastrar Usuário</h2>
    <p>Preencha o formulário abaixo para cadastrar um novo Usuário.</p>
    <br />

    <div class="form form-horizontal">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <div class="control-group">
            <asp:Label ID="Label1" runat="server" CssClass="control-label" AssociatedControlID="UserName">Nome de Usuário</asp:Label>
            <div class="controls">
                <asp:TextBox runat="server" ID="UserName" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                    CssClass="field-validation-error" ErrorMessage="Nome de Usuário deve ser preenchido." />
            </div>
        </div>
        <div class="control-group">
            <asp:Label ID="Label2" runat="server" CssClass="control-label" AssociatedControlID="Email">E-mail</asp:Label>
            <div class="controls">
                <%--<asp:TextBox runat="server" ID="Email" TextMode="Email" />--%>
                <asp:TextBox runat="server" ID="Email" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Email"
                    CssClass="field-validation-error" ErrorMessage="E-mail deve ser preenchido." />
            </div>
        </div>
        <div class="control-group">
            <asp:Label ID="Label3" runat="server" CssClass="control-label" AssociatedControlID="Password">Senha</asp:Label>
            <div class="controls">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Password"
                    CssClass="field-validation-error" ErrorMessage="Senha deve ser preenchido." />
            </div>
        </div>
        <div class="control-group">
            <asp:Label ID="Label4" runat="server" CssClass="control-label" AssociatedControlID="ConfirmPassword">Confirmação de Senha</asp:Label>
            <div class="controls">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="field-validation-error" ErrorMessage="Confirmação de Senha deve ser preenchida." />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="field-validation-error"  ErrorMessage="Senha e Confirmação de Senha devem ser iguais." />
            </div>
        </div>
            <div class="control-group">
                <br /><br />
                <div class="row-fluid">
                    <div class="span2">
                        <asp:LinkButton ID="InsertButton" OnClick="InsertButton_Click" runat="server" CausesValidation="True" CommandName="Insert" Text="Cadastrar" Style="margin-right: 20px;" SkinID="Cadastrar" />
                    </div>
                <div class="span2">
                    <asp:LinkButton ID="InsertCancelButton" OnClick="InsertCancelButton_Click" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" SkinID="Cancelar" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
