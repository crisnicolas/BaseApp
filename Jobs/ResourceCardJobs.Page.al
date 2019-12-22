pageextension 80076 "Resource Card - Jobs" extends "Resource Card"
{
    actions
    {
        addafter("Resource &Capacity")
        {
            action("Resource &Allocated per Job")
            {
                ApplicationArea = Jobs;
                Caption = 'Resource &Allocated per Job';
                Image = ViewJob;
                RunObject = Page "Resource Allocated per Job";
                RunPageLink = "Resource Filter" = FIELD("No.");
                ToolTip = 'View this job''s resource allocation.';
            }
        }
    }
}