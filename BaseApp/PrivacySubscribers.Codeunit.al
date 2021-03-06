codeunit 1755 "Privacy Subscribers"
{

    trigger OnRun()
    begin
    end;

    var
        CustomerFilterTxt: Label 'WHERE(Partner Type=FILTER(Person))', Locked = true;
        VendorFilterTxt: Label 'WHERE(Partner Type=FILTER(Person))', Locked = true;
        ContactFilterTxt: Label 'WHERE(Type=FILTER(Person))', Locked = true;
        ResourceFilterTxt: Label 'WHERE(Type=FILTER(Person))', Locked = true;
        DataSubjectBlockedMsg: Label 'This data subject is already marked as blocked due to privacy. You can export the related data.';

    [EventSubscriber(ObjectType::Codeunit, 1750, 'OnCreateEvaluationData', '', false, false)]
    local procedure CreateEvaluationData()
    var
        DataClassificationEvalData: Codeunit "Data Classification Eval. Data";
    begin
        DataClassificationEvalData.CreateEvaluationData;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1750, 'OnGetDataPrivacyEntities', '', false, false)]
    local procedure OnGetDataPrivacyEntitiesSubscriber(var DataPrivacyEntities: Record "Data Privacy Entities")
    var
        DummyCustomer: Record Customer;
        DummyVendor: Record Vendor;
        DummyContact: Record Contact;
        DummyResource: Record Resource;
        DummyUser: Record User;
        DummyEmployee: Record Employee;
        DummySalespersonPurchaser: Record "Salesperson/Purchaser";
        DataClassificationMgt: Codeunit "Data Classification Mgt.";
    begin
        DataClassificationMgt.InsertDataPrivacyEntity(DataPrivacyEntities, DATABASE::Customer, PAGE::"Customer List",
          DummyCustomer.FieldNo("No."), CustomerFilterTxt, DummyCustomer.FieldNo("Privacy Blocked"));
        DataClassificationMgt.InsertDataPrivacyEntity(DataPrivacyEntities, DATABASE::Vendor, PAGE::"Vendor List",
          DummyVendor.FieldNo("No."), VendorFilterTxt, DummyVendor.FieldNo("Privacy Blocked"));
        DataClassificationMgt.InsertDataPrivacyEntity(DataPrivacyEntities, DATABASE::"Salesperson/Purchaser",
          PAGE::"Salespersons/Purchasers", DummySalespersonPurchaser.FieldNo(Code), ContactFilterTxt,
          DummySalespersonPurchaser.FieldNo("Privacy Blocked"));
        DataClassificationMgt.InsertDataPrivacyEntity(DataPrivacyEntities, DATABASE::Contact, PAGE::"Contact List",
          DummyContact.FieldNo("No."), ContactFilterTxt, DummyContact.FieldNo("Privacy Blocked"));
        DataClassificationMgt.InsertDataPrivacyEntity(DataPrivacyEntities, DATABASE::Employee, PAGE::"Employee List",
          DummyEmployee.FieldNo("No."), '', DummyEmployee.FieldNo("Privacy Blocked"));
        DataClassificationMgt.InsertDataPrivacyEntity(DataPrivacyEntities, DATABASE::User, PAGE::Users,
          DummyUser.FieldNo("User Name"), '', 0);
        DataClassificationMgt.InsertDataPrivacyEntity(DataPrivacyEntities, DATABASE::Resource, PAGE::"Resource List",
          DummyResource.FieldNo("No."), ResourceFilterTxt, DummyResource.FieldNo("Privacy Blocked"));
    end;

    [EventSubscriber(ObjectType::Page, 2501, 'OnAfterActionEvent', 'Install', true, true)]
    local procedure AfterExtensionIsInstalled(var Rec: Record "NAV App")
    var
        DataSensitivity: Record "Data Sensitivity";
        NAVAppObjectMetadata: Record "NAV App Object Metadata";
        "Field": Record "Field";
        DataClassNotificationMgt: Codeunit "Data Class. Notification Mgt.";
        DataClassificationMgt: Codeunit "Data Classification Mgt.";
        RecRef: RecordRef;
        FilterText: Text;
    begin
        if DataClassificationMgt.IsDataSensitivityEmptyForCurrentCompany then
            exit;

        NAVAppObjectMetadata.SetRange("App Package ID", Rec."Package ID");
        NAVAppObjectMetadata.SetRange("Object Type", NAVAppObjectMetadata."Object Type"::Table);

        RecRef.GetTable(NAVAppObjectMetadata);
        FilterText := DataClassNotificationMgt.GetFilterTextForFieldValuesInTable(RecRef, NAVAppObjectMetadata.FieldNo("Object ID"));

        if FilterText <> '' then begin
            Field.SetFilter(TableNo, FilterText);
            Field.SetRange(Class, Field.Class::Normal);
            GetEnabledSensitiveFields(Field);

            if Field.FindSet then begin
                repeat
                    if not DataSensitivity.Get(CompanyName, Field.TableNo, Field."No.") then
                        DataClassificationMgt.InsertDataSensitivityForField(Field.TableNo, Field."No.",
                          DataSensitivity."Data Sensitivity"::Unclassified);
                until Field.Next = 0;

                DataClassNotificationMgt.ShowNotificationIfThereAreUnclassifiedFields;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, 2501, 'OnAfterActionEvent', 'Uninstall', true, true)]
    local procedure AfterExtensionIsUninstalled(var Rec: Record "NAV App")
    var
        DataSensitivity: Record "Data Sensitivity";
        NAVAppObjectMetadata: Record "NAV App Object Metadata";
        DataClassificationMgt: Codeunit "Data Classification Mgt.";
        DataClassNotificationMgt: Codeunit "Data Class. Notification Mgt.";
        RecRef: RecordRef;
        FilterText: Text;
    begin
        if DataClassificationMgt.IsDataSensitivityEmptyForCurrentCompany then
            exit;

        // Remove the fields from the Data Sensitivity table without a confirmation through a notification
        NAVAppObjectMetadata.SetRange("App Package ID", Rec."Package ID");
        NAVAppObjectMetadata.SetRange("Object Type", NAVAppObjectMetadata."Object Type"::Table);

        RecRef.GetTable(NAVAppObjectMetadata);
        FilterText := DataClassNotificationMgt.GetFilterTextForFieldValuesInTable(RecRef, NAVAppObjectMetadata.FieldNo("Object ID"));

        if FilterText <> '' then begin
            DataSensitivity.SetFilter("Table No", FilterText);
            DataSensitivity.SetRange("Data Sensitivity", DataSensitivity."Data Sensitivity"::Unclassified);
            DataSensitivity.DeleteAll;
        end;
    end;

    local procedure GetEnabledSensitiveFields(var "Field": Record "Field")
    begin
        Field.SetRange(Enabled, true);
        Field.SetFilter(ObsoleteState, '<>%1', Field.ObsoleteState::Removed);
        Field.SetFilter(
          DataClassification,
          StrSubstNo('%1|%2|%3',
            Field.DataClassification::CustomerContent,
            Field.DataClassification::EndUserIdentifiableInformation,
            Field.DataClassification::EndUserPseudonymousIdentifiers));
    end;
}

