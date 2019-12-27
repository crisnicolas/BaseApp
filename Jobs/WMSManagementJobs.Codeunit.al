codeunit 87302 "WMS Management - Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WMS Management", 'OnAfterCreateWhseJnlLine', '', false, false)]
    local procedure WMSManagement_OnAfterCreateWhseJnlLine_Jobs(var WhseJournalLine: Record "Warehouse Journal Line"; ItemJournalLine: Record "Item Journal Line"; ItemJnlTemplateType: Option)
    var
        WhseMgt: Codeunit "Whse. Management";
    begin
        if ItemJournalLine."Job No." <> '' then begin
            WhseJournalLine.SetSource(DATABASE::"Job Journal Line", ItemJnlTemplateType, ItemJournalLine."Document No.", ItemJournalLine."Line No.", 0);
            WhseJournalLine."Source Document" := WhseMgt.GetSourceDocument(WhseJournalLine."Source Type", WhseJournalLine."Source Subtype");
            WhseJournalLine."Warehouse Source Document" := WhseMgt.GetSourceDocument(WhseJournalLine."Source Type", WhseJournalLine."Source Subtype");
        end;
    end;
}