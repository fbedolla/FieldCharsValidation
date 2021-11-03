/// <summary>
/// TableExtension FCV GLAccExt (ID 69406) extends Record G/L Account.
/// </summary>
tableextension 69406 "FCV GLAccExt" extends "G/L Account"
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
