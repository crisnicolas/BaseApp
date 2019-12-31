codeunit 80202 "Sales Document - Test - Jobs"
{
    [EventSubscriber(ObjectType::Report, Report::"Sales Document - Test", 'OnCheckShptLines_AddError', '', false, false)]
    local procedure SalesDocumentTest_CheckShptLines_Jobs(SalesLine: Record "Sales Line"; SalesShipmentLine: Record "Sales Shipment Line"; var ErrorCounter: Integer; var ErrorText: array[99] of Text[250])
    var
        Text024: Label 'The %1 on the shipment is not the same as the %1 on the sales header.';
    begin
        if SalesShipmentLine."Job No." <> SalesLine."Job No." then begin
            ErrorCounter := ErrorCounter + 1;
            ErrorText[ErrorCounter] :=
                    StrSubstNo(
                    Text024,
                    SalesLine.FieldCaption("Job No."))
        end;
    end;
}