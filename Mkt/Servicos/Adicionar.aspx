<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Adicionar.aspx.cs" Inherits="Mkt.Serviços.Adicionar" %>
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
            $('#txtCep').mask('99999-999');
            $('#txtTel1, #txtTel2, #txtFax').mask('(99) 9999-9999');
        });
    </script>
    <h2>Cadastrar Serviço</h2>
    <p>Preencha o formulário abaixo para cadastrar um novo Serviço.</p>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:FormView ID="frwNovoServico" RenderOuterTable="false" runat="server" OnItemInserted="frwNovoServico_ItemInserted" DataKeyNames="cod_servico" DataSourceID="sqlNovoServico" DefaultMode="Insert">
        <InsertItemTemplate>
            <div class="form form-horizontal">
               <div class="control-group">
                    <label class="control-label">Serviço</label>
                    <div class="controls">
                        <asp:TextBox ID="des_servicoTextBox" runat="server" Text='<%# Bind("des_servico") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="des_servicoTextBox" runat="server" ErrorMessage="Descrição do Serviço deve ser preenchido."></asp:RequiredFieldValidator>
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">Valor</label>
                    <div class="controls">
                        <asp:TextBox ID="valorTextBox" runat="server" Text='<%# Bind("vlr_servico") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Valor do Serviço deve ser preenchido." ControlToValidate="valorTextBox"></asp:RequiredFieldValidator>
                    </div>
                </div>               
               <div class="control-group">
                    <br />
                    <div class="row-fluid">
                        <div class="span2">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Cadastrar" Style="margin-right: 20px;" SkinID="Cadastrar" />

                        </div>
                        <div class="span2">
                            <asp:LinkButton ID="InsertCancelButton" OnClick="InsertCancelButton_Click" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" SkinID="Cancelar" />

                        </div>
                    </div>
               </div>
            </div>
        </InsertItemTemplate>
    </asp:FormView> 
    <asp:SqlDataSource ID="sqlNovoServico" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        InsertCommand="INSERT INTO [tab_servico] ([des_servico], [vlr_servico], [deletado]) VALUES (@des_servico, @vlr_servico, 0)">
        <InsertParameters>
            <asp:Parameter Name="des_servico" Type="String" />
            <asp:Parameter Name="vlr_servico" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
