pageextension 50001 FACompanyInformation extends "Company Information"
{
    layout
    {

    }

    actions
    {
        addafter("Inventory Setup")
        {
            action("Fixed Assets Setup")
            {
                ApplicationArea = Advanced;
                Caption = 'Fixed Assets Setup';
                Image = FixedAssets;
                RunObject = Page "Fixed Asset Setup";
                ToolTip = 'Define your accounting policies for fixed assets, such as the allowed posting period and whether to allow posting to main assets. Set up your number series for creating new fixed assets.';
            }
        }
    }
}