codeunit 85802 "Inventory Posting to G/L -Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Posting To G/L", 'OnPostInvtPostBufOnAfterInitGenJnlLine', '', false, false)]
    local procedure InventoryPostingToGL_PostInvtPostBuf_Jobs(var GenJournalLine: Record "Gen. Journal Line"; var ValueEntry: Record "Value Entry")
    begin
        GenJournalLine."Job No." := ValueEntry."Job No.";
    end;
}