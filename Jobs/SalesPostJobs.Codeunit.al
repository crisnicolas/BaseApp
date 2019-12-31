codeunit 80080 "Sales-Post - Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostItemTrackingForShipment', '', false, false)]
    local procedure SalesPost_PostItemTrackingForShipment_Jobs(SalesLine: Record "Sales Line"; var SalesShipmentLine: Record "Sales Shipment Line")
    begin
        SalesShipmentLine.TestField("Job No.", SalesLine."Job No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnNotHandledPostItemChargePerShptOnBeforeTestJobNo', '', false, false)]
    local procedure SalesPost_PostItemChargePerShptOnBeforeTestJobNo_Jobs(SalesShipmentLine: Record "Sales Shipment Line")
    begin
        SalesShipmentLine.TestField("Job No.", '');
    end;
}