pageextension 85900 "Service Order - Jobs" extends "Service Order"
{
    actions
    {
        addlast(History)
        {
            action("&Job Ledger Entries")
            {
                ApplicationArea = Service;
                Caption = '&Job Ledger Entries';
                Image = JobLedger;
                RunObject = Page "Job Ledger Entries";
                RunPageLink = "Service Order No." = FIELD("No.");
                RunPageView = SORTING("Service Order No.", "Posting Date")
                                  WHERE("Entry Type" = CONST(Usage));
                ToolTip = 'View all the job ledger entries that result from posting transactions in the service document that involve a job.';
            }
        }
    }
}