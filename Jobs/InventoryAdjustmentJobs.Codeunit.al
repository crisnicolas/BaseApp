codeunit 85895 "Inventory Adjustment - Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Adjustment", 'OnPostItemJnlLineCopyFromValueEntry', '', false, false)]
    local procedure InventoryAdjustment_PostItemJnlLine_Jobs(var ItemJournalLine: Record "Item Journal Line"; ValueEntry: Record "Value Entry")
    begin
        ItemJournalLine."Job No." := ValueEntry."Job No.";
        ItemJournalLine."Job Task No." := ValueEntry."Job Task No.";
    end;
}