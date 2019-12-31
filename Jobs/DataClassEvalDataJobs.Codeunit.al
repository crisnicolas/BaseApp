codeunit 81751 "Data Class. Eval. Data - Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Data Classification Eval. Data", 'OnAfterClassifyItemLedgerEntry', '', true, false)]
    local procedure ClassifyItemLedgerEntryJobFields()
    var
        DummyItemLedgerEntry: Record "Item Ledger Entry";
        TableNo: Integer;
        DataClassificationMgt: Codeunit "Data Classification Mgt.";
    begin
        TableNo := DATABASE::"Item Ledger Entry";
        DataClassificationMgt.SetFieldToCompanyConfidential(TableNo, DummyItemLedgerEntry.FieldNo("Job Task No."));
        DataClassificationMgt.SetFieldToCompanyConfidential(TableNo, DummyItemLedgerEntry.FieldNo("Job No."));
        DataClassificationMgt.SetFieldToCompanyConfidential(TableNo, DummyItemLedgerEntry.FieldNo("Job Purchase"));
    end;
}
