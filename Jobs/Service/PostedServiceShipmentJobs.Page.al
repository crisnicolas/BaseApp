pageextension 85975 "Posted Service Shipment - Jobs" extends "Posted Service Shipment"
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