codeunit 85775 "Whse. Management - Jobs"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Management", 'OnAfterGetWarehouseSourceDocument', '', false, false)]
    local procedure WhseManagement_GetSourceDocument_Jobs(SourceType: Integer; var SourceDocument: Enum "Warehouse Source Document"; var IsHandled: Boolean)
    begin
        if SourceType = Database::"Job Journal Line" then begin
            SourceDocument := SourceDocument::"Job Jnl.";
            IsHandled := true;
        end;
    end;
}