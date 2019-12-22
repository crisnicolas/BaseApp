pageextension 85905 "Service Lines - Jobs" extends "Service Lines"
{
    actions
    {
        addafter("&Warranty Ledger Entries")
        {
            action("&Job Ledger Entries")
            {
                ApplicationArea = Jobs;
                Caption = '&Job Ledger Entries';
                Image = JobLedger;
                RunObject = Page "Job Ledger Entries";
                RunPageLink = "Service Order No." = FIELD("Document No.");
                RunPageView = SORTING("Service Order No.", "Posting Date")
                                  WHERE("Entry Type" = CONST(Usage));
                ToolTip = 'View all the job ledger entries that result from posting transactions in the service document that involve a job.';
            }
        }
    }
}