/// <summary>
/// TableExtension FCV Bank Ext (ID 69402) extends Record Bank Account.
/// </summary>
tableextension 69402 "FCV Bank Ext" extends "Bank Account"
{
    fields
    {
        modify(Name)
        {
            trigger OnBeforeValidate()
            begin
                checkSpecialCharstext(Rec.Name);
            end;
        }
        modify("Name 2")
        {
            trigger OnBeforeValidate()
            begin
                checkSpecialCharstext(Rec."Name 2");
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