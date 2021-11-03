/// <summary>
/// TableExtension FCV CustBankExt (ID 69404) extends Record Customer Bank Account.
/// </summary>
tableextension 69404 "FCV CustBankExt" extends "Customer Bank Account"
{
    fields
    {
        modify(Address)
        {
            trigger OnBeforeValidate()
            begin
                checkSpecialCharstext(Rec.Address);
            end;
        }
        modify("Address 2")
        {
            trigger OnBeforeValidate()
            begin
                checkSpecialCharstext(Rec."Address 2");
            end;
        }
        modify("Bank Branch No.")
        {
            trigger OnBeforeValidate()
            begin
                checkSpecialCharstext(Rec."Bank Branch No.");
            end;
        }
        modify("Bank Account No.")
        {
            trigger OnBeforeValidate()
            begin
                checkSpecialCharstext(Rec."Bank Account No.");
            end;
        }
        modify("Phone No.")
        {
            trigger OnBeforeValidate()
            var
                myInt: Integer;
            begin
                checkSpecialCharstext(Rec."Phone No.");
            end;
        }
        modify("Fax No.")
        {
            trigger OnBeforeValidate()
            begin
                checkSpecialCharstext(Rec."Fax No.");
            end;
        }
        modify("E-Mail")
        {
            trigger OnBeforeValidate()
            begin
                checkSpecialCharstext(Rec."E-Mail");
            end;
        }
    }

    var
        SpecialCharsErr: Label 'You cannot use special characters in this field.';


    local procedure checkSpecialCharstext(Var Textfield: text)
    var
        SpecChars: Label '°|!|"|#|$|%|/|(|)|=|?|¡|¿|´|+|¨|*|{|}|[|]|-|_';
        Len: Integer;
    begin
        Clear(Len);
        Len := StrLen(DelChr(Textfield, '=', DelChr(Textfield, '=', SpecChars)));
        if Len > 0 then
            Error(SpecialCharsErr + ' ' + SpecChars);
    end;

}
