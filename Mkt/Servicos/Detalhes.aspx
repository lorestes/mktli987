<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Detalhes.aspx.cs" Inherits="Mkt.Serviços.Detalhes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Detalhes de Serviço</h2>
    <p>Utilize o formulário abaixo para visualizar e editar todas as informações sobre o Serviço.</p>
    <br />
     <asp:FormView ID="frwNovoServico" RenderOuterTable="False" runat="server" OnItemUpdated="frwNovoServico_ItemUpdated" DataKeyNames="cod_servico" DataSourceID="sqlServico" DefaultMode="Edit">
        <EditItemTemplate>
            <form class="form-inline">
            <fieldset>
                <asp:HiddenField ID="hdnservico" Value='<%# Bind("cod_servico") %>' runat="server" />
                <label>Serviço</label>
                <asp:TextBox ID="des_servicoTextBox" runat="server" Text='<%# Bind("des_servico") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="des_servicoTextBox" runat="server" ErrorMessage="Descrição do Serviço deve ser preenchido."></asp:RequiredFieldValidator>
                <label>Valor</label>
                <asp:TextBox ID="valorTextBox" runat="server" Text='<%# Bind("vlr_servico") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="valorTextBox" runat="server" ErrorMessage="Valor do Serviço deve ser preenchido."></asp:RequiredFieldValidator>
                <br /><br />
                    <div class="row-fluid">
                        <div class="span2">
                            <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Salvar" Style="margin-right: 20px;" SkinID="Salvar" />

                        </div>
                        <div class="span2">
                            <asp:LinkButton ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" SkinID="Cancelar" />

                        </div>
                    </div> 
             </fieldset>
            </form>
        </EditItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sqlServico" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT * FROM tab_servico WHERE cod_servico = @cod_servico" 
        UpdateCommand="UPDATE tab_servico
                        SET des_servico = @des_servico, 
                            vlr_servico = @vlr_servico
                        WHERE cod_servico = @cod_servico">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="cod_servico" QueryStringField="p" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="cod_servico" Type="Int32" />
            <asp:Parameter Name="des_servico" Type="String" />
            <asp:Parameter Name="vlr_servico" Type="Decimal" />
        </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>
