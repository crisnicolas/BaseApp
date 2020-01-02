pageextension 86621 "Blanket S.Order Arch.Sub. Jobs" extends "Blanket Sales Order Arch. Sub."
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