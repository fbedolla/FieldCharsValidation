/// <summary>
/// Unknown FCV Permset (ID 69400).
/// </summary>
permissionset 69400 "FCV Permset"
{
    Assignable = true;
    Caption = 'FCV Permset';
    IncludedPermissionSets =
        "Bank Accounts - Edit",
        "Customer - Edit";
        
    Permissions = 
        tabledata Customer = rimd,
        tabledata Vendor = rimd,
        tabledata "Customer Bank Account" = rimd,
        tabledata "Vendor Bank Account" = rimd,
        tabledata "G/L Account" = rimd,
        tabledata "Ship-to Address" = rimd,
        tabledata "Bank Account" = rimd;

}
