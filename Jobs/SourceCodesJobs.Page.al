pageextension 80257 "Source Codes - Jobs" extends "Source Codes"
{
    actions
    {
        addafter("Resource Registers")
        {
            action("Job Registers")
            {
                ApplicationArea = Jobs;
                Caption = 'Job Registers';
                Image = JobRegisters;
                RunObject = Page "Job Registers";
                RunPageLink = "Source Code" = FIELD(Code);
                RunPageView = SORTING("Source Code");
                ToolTip = 'Open the related job registers.';
            }
        }
    }
}