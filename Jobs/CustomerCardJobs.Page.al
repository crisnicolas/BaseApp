pageextension 80021 "Customer Card - Jobs" extends "Customer Card"
{
    actions
    {
        addlast(Documents)
        {
            action("&Jobs")
            {
                ApplicationArea = Jobs;
                Caption = '&Jobs';
                Image = Job;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Job List";
                RunPageLink = "Bill-to Customer No." = FIELD("No.");
                RunPageView = SORTING("Bill-to Customer No.");
                ToolTip = 'Open the list of ongoing jobs.';
            }
        }
    }
}