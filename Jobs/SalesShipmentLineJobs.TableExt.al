tableextension 80111 "Sales Shipment Line - Jobs" extends "Sales Shipment Line"
{
    fields
    {
        field(45; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            Editable = false;
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("Job No."));
        }
        field(1002; "Job Contract Entry No."; Integer)
        {
            Caption = 'Job Contract Entry No.';
            Editable = false;
        }
    }
}