pageextension 85851 "GetPostDoc-S.ShptLn Sbfrm Jobs" extends "Get Post.Doc - S.ShptLn Sbfrm"
{
    layout
    {
        addafter(RevUnitCostLCY)
        {
            field("Job No."; "Job No.")
            {
                ApplicationArea = SalesReturnOrder;
                ToolTip = 'Specifies the number of the related job.';
                Visible = false;
            }
        }
    }
}