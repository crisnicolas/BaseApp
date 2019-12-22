pageextension 80072 "Resource Groups - Jobs" extends "Resource Groups"
{
    actions
    {
        addafter(ResGroupCapacity)
        {
            action("Res. Group All&ocated per Job")
            {
                ApplicationArea = Jobs;
                Caption = 'Res. Group All&ocated per Job';
                Image = ViewJob;
                RunObject = Page "Res. Gr. Allocated per Job";
                RunPageLink = "Resource Gr. Filter" = FIELD("No.");
                ToolTip = 'View the job allocations of the resource group.';
            }
        }
    }
}