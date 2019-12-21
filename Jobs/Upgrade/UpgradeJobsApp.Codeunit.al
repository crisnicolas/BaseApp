// From codeunit 104000 "Upgrade - BaseApp"
codeunit 84000 "Upgrade - JobsApp"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        UpdateJobs();
    end;

    local procedure UpdateJobs()
    var
        Job: Record "Job";
        UpgradeTag: Codeunit "Upgrade Tag";
        UpgradeTagDefinitions: Codeunit "Upgrade Tag Definitions";
        IntegrationManagement: Codeunit "Integration Management";
        RecordRef: RecordRef;
    begin
        IF UpgradeTag.HasUpgradeTag(UpgradeTagDefinitions.GetAddingIDToJobsUpgradeTag()) THEN
            EXIT;

        IF Job.FINDSET(TRUE, FALSE) THEN
            REPEAT
                IF ISNULLGUID(Job.Id) THEN BEGIN
                    RecordRef.GETTABLE(Job);
                    IntegrationManagement.InsertUpdateIntegrationRecord(RecordRef, CURRENTDATETIME());
                    RecordRef.SETTABLE(Job);
                    Job.Modify;
                    Job.UpdateReferencedIds;
                END;
            UNTIL Job.NEXT = 0;
        UpgradeTag.SetUpgradeTag(UpgradeTagDefinitions.GetAddingIDToJobsUpgradeTag());
    end;
}