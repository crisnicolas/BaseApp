pageextension 85163 "Sales Quote Archive Sbfrm Jobs" extends "Sales Quote Archive Subform"
{
    layout
    {
        addafter("Allow Item Charge Assignment")
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