codeunit 85805 "Item Charge Assgnt(Purch) Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Charge Assgnt. (Purch.)", 'OnNotHandledCreateSalesShptChargeAssgnt', '', false, false)]
    local procedure ItemChargeAssgntPurch_CreateSalesShptChargeAssgnt_Jobs(var FromSalesShptLine: Record "Sales Shipment Line")
    begin
        FromSalesShptLine.TestField("Job No.", '');
    end;
}