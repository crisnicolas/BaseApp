pageextension 85974 "Posted Service Shipments- Jobs" extends "Posted Service Shipments"
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
                RunPageLink = "Document No." = FIELD("No.");
                ToolTip = 'View all the job ledger entries that result from posting transactions in the service document that involve a job.';
            }
        }
    }

}