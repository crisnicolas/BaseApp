tableextension 85907 "Service Ledger Entry - Jobs" extends "Service Ledger Entry"
{
    fields
    {
        field(40; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job."No." WHERE("Bill-to Customer No." = FIELD("Bill-to Customer No."));
        }
        field(58; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("Job No."));
        }
        field(59; "Job Line Type"; Option)
        {
            Caption = 'Job Line Type';
            InitValue = Budget;
            OptionCaption = ' ,Budget,Billable,Both Budget and Billable';
            OptionMembers = " ",Budget,Billable,"Both Budget and Billable";
        }
        field(60; "Job Posted"; Boolean)
        {
            Caption = 'Job Posted';
        }
    }
}