table 1458 "RC Headlines User Data"
{
    Caption = 'Role Center Headlines User Data';

    fields
    {
        field(1; "User ID"; Guid)
        {
            Caption = 'User ID';
            DataClassification = SystemMetadata;
        }
        field(2; "Role Center Page ID"; Integer)
        {
            Caption = 'Role Center';
            DataClassification = SystemMetadata;
        }
        field(3; "User workdate"; Date)
        {
            Caption = 'User workdate (used for computations)';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "User ID", "Role Center Page ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

