pageextension 80168 "Serv.Led. Entries Preview-Jobs" extends "Service Ledger Entries Preview"
{
    layout
    {
        addafter("Service Order No.")
        {
            field("Job No."; "Job No.")
            {
                ApplicationArea = Jobs;
                ToolTip = 'Specifies the number of the related job.';
                Visible = false;
            }
            field("Job Task No."; "Job Task No.")
            {
                ApplicationArea = Jobs;
                ToolTip = 'Specifies the number of the related job task.';
                Visible = false;
            }
            field("Job Line Type"; "Job Line Type")
            {
                ApplicationArea = Jobs;
                ToolTip = 'Specifies the journal line type that is created in the Job Planning Line table and linked to this job ledger entry.';
                Visible = false;
            }
        }
    }
}