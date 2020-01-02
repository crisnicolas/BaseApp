pageextension 86628 "Sales Ret.Order Arc Sbfrm Jobs" extends "Sales Return Order Arc Subform"
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
        }
    }
}