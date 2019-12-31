pageextension 85708 "Get Shipment Lines - Jobs" extends "Get Shipment Lines"
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