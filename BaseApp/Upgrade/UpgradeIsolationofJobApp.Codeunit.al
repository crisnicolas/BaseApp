codeunit 104050 "Upgrade - Isolation of JobApp"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        FillNewEnumFieldWarehouseSourceDocument();
    end;

    local procedure FillNewEnumFieldWarehouseSourceDocument()
    var
        WarehouseRequest: Record "Warehouse Request";
        WarehouseEntry: Record "Warehouse Entry";
        WarehouseActivityHeader: Record "Warehouse Activity Header";
        WarehouseActivityLine: Record "Warehouse Activity Line";
        WarehouseJournalLine: Record "Warehouse Journal Line";
        WhseWorksheetLine: Record "Whse. Worksheet Line";
        WhseCrossDockOpportunity: Record "Whse. Cross-Dock Opportunity";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
        WarehouseReceiptLine: Record "Warehouse Receipt Line";
        PostedWhseShipmentLine: Record "Posted Whse. Shipment Line";
        PostedWhseReceiptLine: Record "Posted Whse. Receipt Line";
        PostedInvtPickHeader: Record "Posted Invt. Pick Header";
        PostedInvtPickLine: Record "Posted Invt. Pick Line";
        PostedInvtPutawayHeader: Record "Posted Invt. Put-away Header";
        PostedInvtPutawayLine: Record "Posted Invt. Put-away Line";
        RegisteredInvtMovementHdr: Record "Registered Invt. Movement Hdr.";
        RegisteredInvtMovementLine: Record "Registered Invt. Movement Line";
        RegisteredWhseActivityLine: Record "Registered Whse. Activity Line";
        WarehouseSourceFilter: Record "Warehouse Source Filter";

        UpgradeTag: Codeunit "Upgrade Tag";
        UpgradeTagDefinitions: Codeunit "Upgrade Tag Definitions";
    begin
        if UpgradeTag.HasUpgradeTag(UpgradeTagDefinitions.GetWarehouseSourceDocumentUpgradeTag()) then
            exit;

        with WarehouseRequest do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with WarehouseEntry do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with WarehouseActivityHeader do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with WarehouseActivityLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with WarehouseJournalLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with WhseWorksheetLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with WhseCrossDockOpportunity do
            if FindSet() then
                repeat
                    "From Warehouse Source Document" := "From Source Document";
                    "To Warehouse Source Document" := "To Source Document";
                    Modify();
                until Next() = 0;

        with WarehouseShipmentLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with WarehouseReceiptLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with PostedWhseShipmentLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with PostedWhseReceiptLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with PostedInvtPickHeader do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with PostedInvtPickLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with PostedInvtPutawayHeader do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with PostedInvtPutawayLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with RegisteredInvtMovementHdr do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with RegisteredInvtMovementLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with RegisteredWhseActivityLine do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        with WarehouseSourceFilter do
            if FindSet() then
                repeat
                    "Warehouse Source Document" := "Source Document";
                    Modify();
                until Next() = 0;

        UpgradeTag.SetUpgradeTag(UpgradeTagDefinitions.GetWarehouseSourceDocumentUpgradeTag());
    end;
}