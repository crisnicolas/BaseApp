pageextension 85160 "Sales Order Archive Sbfrm Jobs" extends "Sales Order Archive Subform"
{
    layout
    {
        addafter("Shipping Time")
        {
            field("Job No."; "Job No.")
            {
                ApplicationArea = Suite;
                ToolTip = 'Specifies the job number that the archived document was linked to.';
                Visible = false;
            }
        }
    }
}