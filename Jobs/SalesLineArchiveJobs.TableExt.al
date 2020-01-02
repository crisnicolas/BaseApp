tableextension 85108 "Sales Line Archive - Jobs" extends "Sales Line Archive"
{
    fields
    {
        field(45; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
    }
}