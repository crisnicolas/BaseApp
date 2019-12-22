codeunit 85907 "Service Ledger Entry - Jobs"
{
    [EventSubscriber(ObjectType::Table, Database::"Service Ledger Entry", 'OnAfterCopyFromServLine', '', false, false)]
    local procedure ServiceLedgerEntry_CopyFromServLine_Jobs(var ServiceLedgerEntry: Record "Service Ledger Entry"; ServiceLine: Record "Service Line")
    begin
        ServiceLedgerEntry."Job No." := ServiceLine."Job No.";
        ServiceLedgerEntry."Job Task No." := ServiceLine."Job Task No.";
        ServiceLedgerEntry."Job Line Type" := ServiceLine."Job Line Type";
    end;
}