codeunit 80022 "Item Jnl.-Post Line - Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitValueEntry', '', false, false)]
    local procedure ItemJnlPostLine_InitValueEntry_Jobs(var ValueEntry: Record "Value Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        with ItemJournalLine do begin
            if "Job No." <> '' then begin
                ValueEntry."Job No." := "Job No.";
                ValueEntry."Job Task No." := "Job Task No.";
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterApplyItemLedgEntrySetFilters', '', false, false)]
    local procedure ApplyItemLedgEntrySetJobFilters(var ItemLedgerEntry2: Record "Item Ledger Entry"; ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        if ItemLedgerEntry."Job Purchase" then begin
            ItemLedgerEntry2.SetRange("Job No.", ItemLedgerEntry."Job No.");
            ItemLedgerEntry2.SetRange("Job Task No.", ItemLedgerEntry."Job Task No.");
            ItemLedgerEntry2.SetRange("Document Type", ItemLedgerEntry."Document Type");
            ItemLedgerEntry2.SetRange("Document No.", ItemLedgerEntry."Document No.");
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure InitItemLedgEntryJobs(var NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        NewItemLedgEntry."Job No." := ItemJournalLine."Job No.";
        NewItemLedgEntry."Job Task No." := ItemJournalLine."Job Task No.";
        NewItemLedgEntry."Job Purchase" := ItemJournalLine."Job Purchase";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeUpdateItemLedgEntry', '', false, false)]
    local procedure OnUpdateItemLedgEntryJobs(var ItemLedgEntry: Record "Item Ledger Entry"; CalledFromAdjustment: Boolean; var MarkToAdjust: Boolean)
    var
        Item: Record Item;
        ItemJnlPostLine: Codeunit "Item Jnl.-Post Line";
    begin
        if Item.Get(ItemLedgEntry."Item No.") then;

        if (ItemLedgEntry."Job Purchase") and
              (ItemLedgEntry.Quantity <> ItemLedgEntry."Remaining Quantity") and not ItemLedgEntry."Applied Entry to Adjust" and
              (Item.Type = Item.Type::Inventory) and
              (not CalledFromAdjustment or ItemJnlPostLine.AppliedEntriesToReadjust(ItemLedgEntry))
           then begin
            MarkToAdjust := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]
    local procedure OnInsertItemLedgEntryJobs(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        if ItemJournalLine."Job No." <> '' then begin
            ItemLedgerEntry."Job No." := ItemJournalLine."Job No.";
            ItemLedgerEntry."Job Task No." := ItemJournalLine."Job Task No.";
        end;
    end;
}