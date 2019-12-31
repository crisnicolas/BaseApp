pageextension 85824 "Sales Shipment Lines - Jobs" extends "Sales Shipment Lines"
{
    layout
    {
        addafter("Appl.-to Item Entry")
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