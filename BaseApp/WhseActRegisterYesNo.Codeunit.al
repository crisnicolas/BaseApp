codeunit 7306 "Whse.-Act.-Register (Yes/No)"
{
    TableNo = "Warehouse Activity Line";

    trigger OnRun()
    begin
        WhseActivLine.Copy(Rec);
        Code;
        Copy(WhseActivLine);
    end;

    var
        Text001: Label 'Do you want to register the %1 Document?';
        WhseActivLine: Record "Warehouse Activity Line";
        WhseActivityRegister: Codeunit "Whse.-Activity-Register";
        WMSMgt: Codeunit "WMS Management";
        Text002: Label 'The document %1 is not supported.';

    local procedure "Code"()
    begin
        OnBeforeCode(WhseActivLine);

        with WhseActivLine do begin
            if ("Activity Type" = "Activity Type"::"Invt. Movement") and
               not ("Warehouse Source Document" in ["Warehouse Source Document"::" ",
                                          "Warehouse Source Document"::"Production Consumption",
                                          "Warehouse Source Document"::"Assembly Consumption"])
            then
                Error(Text002, "Warehouse Source Document");

            WMSMgt.CheckBalanceQtyToHandle(WhseActivLine);

            if not Confirm(Text001, false, "Activity Type") then
                exit;

            WhseActivityRegister.Run(WhseActivLine);
            Clear(WhseActivityRegister);
        end;

        OnAfterCode(WhseActivLine);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCode(var WarehouseActivityLine: Record "Warehouse Activity Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCode(var WarehouseActivityLine: Record "Warehouse Activity Line")
    begin
    end;
}

