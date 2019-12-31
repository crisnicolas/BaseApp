pageextension 80167 "Item Ledger Entries Prev.-Jobs" extends "Item Ledger Entries Preview"
{
    layout
    {
        addlast(Control1)
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
        }
    }
}