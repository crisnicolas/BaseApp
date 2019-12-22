codeunit 85819 "Undo Serv.Consump. Line - Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Undo Service Consumption Line", 'OnBeforeCheckServShptLine', '', false, false)]
    local procedure UndoServiceConsumptionLine_CheckServShptLine_Jobs(var ServiceShipmentLine: Record "Service Shipment Line")
    var
        ServiceLedgerEntry: Record "Service Ledger Entry";
        Text004: Label 'You cannot undo consumption on the line because it has been already posted to Jobs.';
    begin
        // Check if there was consumption posted to jobs
        ServiceLedgerEntry.Reset;
        ServiceLedgerEntry.SetRange("Document No.", ServiceShipmentLine."Document No.");
        ServiceLedgerEntry.SetRange("Posting Date", ServiceShipmentLine."Posting Date");
        ServiceLedgerEntry.SetRange("Document Line No.", ServiceShipmentLine."Line No.");
        ServiceLedgerEntry.SetRange("Service Order No.", ServiceShipmentLine."Order No.");
        ServiceLedgerEntry.SetRange("Job Posted", true);
        if not ServiceLedgerEntry.IsEmpty then
            Error(Text004);
    end;
}