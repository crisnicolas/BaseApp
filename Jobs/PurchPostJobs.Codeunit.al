codeunit 80090 "Purch.-Post - Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnNotHandledPostItemChargePerSalesShptOnBeforeTestJobNo', '', false, false)]
    local procedure PurchPost_PostItemChargePerSalesShpt_Jobs(SalesShipmentLine: Record "Sales Shipment Line")
    begin
        SalesShipmentLine.TestField("Job No.", '');
    end;
}