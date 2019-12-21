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
}