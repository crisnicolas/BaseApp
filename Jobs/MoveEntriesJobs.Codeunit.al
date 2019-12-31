codeunit 80361 "MoveEntries - Jobs"
{
    Permissions = TableData "Job Ledger Entry" = rm;

    procedure MoveJobEntries(Job: Record Job)
    var
        JobLedgEntry: Record "Job Ledger Entry";
        PurchOrderLine: Record "Purchase Line";
        TimeSheetLine: Record "Time Sheet Line";
        ServLedgEntry: Record "Service Ledger Entry";
        AccountingPeriod: Record "Accounting Period";
        NewJobNo: Code[20];
        Text000: Label 'You cannot delete %1 %2 because it has ledger entries in a fiscal year that has not been closed yet.';
        Text001: Label 'You cannot delete %1 %2 because there are one or more open ledger entries.';
        Text006: Label 'You cannot delete %1 %2 because it has ledger entries.';
        Text007: Label 'You cannot delete %1 %2 because there are outstanding purchase order lines.';
        Text015: Label 'You cannot delete %1 %2 because there are outstanding purchase return order lines.';
        TimeSheetLinesErr: Label 'You cannot delete job %1 because it has open or submitted time sheet lines.', Comment = 'You cannot delete job JOB001 because it has open or submitted time sheet lines.';
    begin
        OnBeforeMoveJobEntries(Job, NewJobNo);

        JobLedgEntry.SetCurrentKey("Job No.");
        JobLedgEntry.SetRange("Job No.", Job."No.");
        if not JobLedgEntry.IsEmpty then
            Error(
              Text006,
              Job.TableCaption, Job."No.");

        TimeSheetLine.SetRange(Type, TimeSheetLine.Type::Job);
        TimeSheetLine.SetRange("Job No.", Job."No.");
        TimeSheetLine.SetFilter(Status, '%1|%2', TimeSheetLine.Status::Open, TimeSheetLine.Status::Submitted);
        if not TimeSheetLine.IsEmpty then
            Error(TimeSheetLinesErr, Job."No.");

        PurchOrderLine.SetCurrentKey("Document Type");
        PurchOrderLine.SetFilter(
          "Document Type", '%1|%2',
          PurchOrderLine."Document Type"::Order,
          PurchOrderLine."Document Type"::"Return Order");
        PurchOrderLine.SetRange("Job No.", Job."No.");
        if PurchOrderLine.FindFirst then begin
            if PurchOrderLine."Document Type" = PurchOrderLine."Document Type"::Order then
                Error(Text007, Job.TableCaption, Job."No.");
            if PurchOrderLine."Document Type" = PurchOrderLine."Document Type"::"Return Order" then
                Error(Text015, Job.TableCaption, Job."No.");
        end;

        ServLedgEntry.Reset;
        ServLedgEntry.SetRange("Job No.", Job."No.");
        AccountingPeriod.SetRange(Closed, false);
        if AccountingPeriod.FindFirst then
            ServLedgEntry.SetFilter("Posting Date", '>=%1', AccountingPeriod."Starting Date");
        if not ServLedgEntry.IsEmpty then
            Error(
              Text000,
              Job.TableCaption, Job."No.");

        ServLedgEntry.SetRange("Posting Date");
        ServLedgEntry.SetRange(Open, true);
        if not ServLedgEntry.IsEmpty then
            Error(
              Text001,
              Job.TableCaption, Job."No.");

        ServLedgEntry.SetRange(Open);
        ServLedgEntry.ModifyAll("Job No.", NewJobNo);

        OnAfterMoveJobEntries(Job, JobLedgEntry, TimeSheetLine, ServLedgEntry);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeMoveJobEntries(Job: Record Job; var NewJobNo: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterMoveJobEntries(Job: Record Job; var JobLedgerEntry: Record "Job Ledger Entry"; var TimeSheetLine: Record "Time Sheet Line"; var ServiceLedgerEntry: Record "Service Ledger Entry")
    begin
    end;
}