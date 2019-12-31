pageextension 80131 "Posted Sales Shpt. Sbfrm Jobs" extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter("Shipping Time")
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