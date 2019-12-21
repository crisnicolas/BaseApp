pageextension 85807 "Value Entries Preview - Jobs" extends "Value Entries Preview"
{
    layout
    {
        addafter("Valued By Average Cost")
        {
            field("Job No."; "Job No.")
            {
                ApplicationArea = Jobs;
                ToolTip = 'Specifies the number of the job that the value entry relates to.';
                Visible = false;
            }
            field("Job Task No."; "Job Task No.")
            {
                ApplicationArea = Jobs;
                ToolTip = 'Specifies the number of the related job task.';
                Visible = false;
            }
            field("Job Ledger Entry No."; "Job Ledger Entry No.")
            {
                ApplicationArea = Jobs;
                ToolTip = 'Specifies the number of the job ledger entry that the value entry relates to.';
                Visible = false;
            }
        }
    }
}