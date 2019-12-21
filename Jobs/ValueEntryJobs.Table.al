tableextension 85802 "Value Entry - Jobs" extends "Value Entry"
{
    fields
    {
        field(1000; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job."No.";
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("Job No."));
        }
        field(1002; "Job Ledger Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Job Ledger Entry No.';
            TableRelation = "Job Ledger Entry"."Entry No.";
        }
    }
    keys
    {
        key(Key13; "Job No.", "Job Task No.") //REVIEW: Original key was "Job No.", "Job Task No.", "Document No."
        {
        }
    }
}