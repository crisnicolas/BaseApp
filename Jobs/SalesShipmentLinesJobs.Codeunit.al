codeunit 85824 "Sales Shipment Lines - Jobs"
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Shipment Lines", 'OnAfterSetFilters', '', false, false)]
    local procedure SalesShipmentLines_SetFilters_Jobs(var SalesShipmentLine: Record "Sales Shipment Line")
    begin
        SalesShipmentLine.SetRange("Job No.", '');
    end;
}