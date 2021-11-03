/// <summary>
/// TableExtension FCV CustExt (ID 69400) extends Record Customer.
/// </summary>
tableextension 69400 "FCV CustExt" extends Customer
{
    fields
    {
        modify("VAT Registration No.")
        {
            trigger OnBeforeValidate()
            begin
                checkSpecialCharstext(Rec."VAT Registration No.");
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
        modify("RFC No.")
        {
            trigger OnBeforeValidate()
            begin
                checkSpecialCharsCode(Rec."RFC No.");
            end;
        }
    }

    var
        SpecialCharsErr: Label 'You cannot use special characters in this field.';

    local procedure checkSpecialCharsCode(Var Textfield: Code[13])
    var
        SpecChars: Label '°|!|"|#|$|%|/|(|)|=|?|¡|¿|´|+|¨|*|{|}|[|]|-|_| |.';
        Len: Integer;
    begin
        Clear(Len);
        Len := StrLen(DelChr(Textfield, '=', DelChr(Textfield, '=', SpecChars)));
        if Len > 0 then
            Error(SpecialCharsErr);
    end;

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
