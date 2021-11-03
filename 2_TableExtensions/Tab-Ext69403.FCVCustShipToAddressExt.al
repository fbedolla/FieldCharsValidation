/// <summary>
/// TableExtension FCV CustShipToAddress Ext (ID 69403) extends Record Ship-to Address.
/// </summary>
tableextension 69403 "FCV CustShipToAddress Ext" extends "Ship-to Address"
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
