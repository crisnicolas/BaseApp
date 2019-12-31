pageextension 80525 "Posted Sales Shpt. Lines Jobs" extends "Posted Sales Shipment Lines"
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