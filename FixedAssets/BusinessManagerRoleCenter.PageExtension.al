pageextension 59022 FABusinessManagerRoleCenter extends "Business Manager Role Center"
{
    layout
    {

    }

    actions
    {
        addafter("G/L Budgets")
        {
            action(FixedAssetList)
            {
                ApplicationArea = FixedAssets;
                Caption = 'Fixed Assets';
                RunObject = Page "Fixed Asset List";
                ToolTip = 'Manage periodic depreciation of your machinery or machines, keep track of your maintenance costs, manage insurance policies related to fixed assets, and monitor fixed asset statistics.';
            }
        }
    }
}