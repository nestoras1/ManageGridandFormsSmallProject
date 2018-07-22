<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="CSS/jquery-ui.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.11.0.min.js"></script>
    <script src="Scripts/jquery.jqGrid.js"></script>
    <script src="Scripts/grid.locale-en.js"></script>
    <link href="CSS/ui.jqgrid.css" rel="stylesheet" />
    
    <script type="text/javascript"> 
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
                colModel: [
                    {
						label: 'OrderID',
                        name: 'OrderID',
                        width: 35,
                        formatter: formatTitle,
                        search: true
                    },
                    {
						label: 'ShipName',
                        name: 'ShipName',
                        width: 100,
                        formatter: formatLink,
                        search: true,
                        editable: true,
                        sortable: true
                    },
                    {
						label: 'ShipAddress',
                        name: 'ShipAddress',
                        width: 70,
                        search: false,
                        editable: true
                    },
                    {
						label: 'ShipCountry',
                        name: 'ShipCountry',
                        width: 35,
                        search: true,
                        editable: true
                    }
                ],
                loadonce: true,
                viewrecords: true, 
                height: 450,
                width: 850,
                rowList: [5, 10, 15],
                rowNum: 15,
                sortName: 'OrderID',
				datatype: 'local',
                pager: "#jqGridPager",
                caption: "Load data",
                emptyrecords: 'No Records To Display'
            });
            $("#jqGrid").jqGrid('navGrid', '#jqGridPager', { edit: true, add: true, del: true, search: true, refresh: true, searchtext: "Search", addtext: "Add", edittext: "Edit", deltext: "Delete", refreshtext: "Refresh" },
                {
                    //edit
                    width: 600,
                    url: 'Default.aspx/EditOrders',
                    closeAfterEdit: true,
                    afterComplete: function (response) {
                        $('#jqGrid').setGridParam({ datatype: 'json', page: 1 }).trigger('reloadGrid');
                    }
                },
                {
                    //add
                    width: 600,
                    url: 'Default.aspx/AddOrders',
                    closeAfterEdit: true,
                    afterComplete: function (response) {
                        $('#jqGrid').setGridParam({ datatype: 'json', page: 1 }).trigger('reloadGrid');
                    }
                },
                {
                    //delete
                    url: 'Default.aspx/DeleteOrders',
                    closeOnEscape: true,
                    closeAfterDelete: true,
                    reloadAfterSubmit: true,
                    closeOnEscape: true,
                    drag: true,
                    afterComplete: function (response) {  
                        $('#jqGrid').setGridParam({ datatype: 'json', page: 1 }).trigger('reloadGrid');
                    }
                }

            );

            fetchGridData();

            function fetchGridData() {
                
                var gridArrayData = [];
				$("#jqGrid")[0].grid.beginReq();
                $.ajax({
                            url: "Default.aspx/LoadData",
                            type: "POST",
                            dataType: "json",
                            data: "{}",
                            contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        var dat = JSON.parse(result.d);
                        for (var i = 0; i < dat.length; i++) {
                            var item = dat[i];
                            gridArrayData.push({
                                OrderID: item.OrderID,
                                ShipName: item.ShipName,
                                ShipAddress: item.ShipAddress,
                                ShipCountry: item.ShipCountry
                            });                            
                        }
						$("#jqGrid").jqGrid('setGridParam', { data: gridArrayData});
						$("#jqGrid")[0].grid.endReq();
						$("#jqGrid").trigger('reloadGrid');
                    }
                });
            }

            function formatTitle(cellValue, options, rowObject) {
                return cellValue;
            };

            function formatLink(cellValue, options, rowObject) {
                return cellValue;
            };
        });
        </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <table id="jqGrid"></table>
                <div id="jqGridPager" ></div>
        </div>

        <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
    </form>
</body>
</html>
