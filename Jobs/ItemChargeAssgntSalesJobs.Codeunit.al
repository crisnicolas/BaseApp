codeunit 85807 "Item Charge Assgnt(Sales) Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Charge Assgnt. (Sales)", 'OnCreateShptChargeAssgntOnFromSalesShptLineLoop', '', false, false)]
    local procedure ItemChargeAssgntSales_CreateShptChargeAssgnt_Jobs(var FromSalesShptLine: Record "Sales Shipment Line")
    begin
        FromSalesShptLine.TestField("Job No.", '');
    end;
}