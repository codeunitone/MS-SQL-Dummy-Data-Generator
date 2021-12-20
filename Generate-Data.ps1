param (
    [Parameter(Mandatory = $true)]
    [string]
    $Server,

    [Parameter(Mandatory = $true)]
    [string]
    $Database,

    [Parameter(Mandatory = $true)]
    [string]
    $TableName
)

# Import Helpers
Get-ChildItem $PSScriptRoot\Helper -Filter '*.ps1' | ForEach-Object {
    Write-Debug "Importing $_"
    . $_.FullName
}

$TableSchema = Get-TableSchema -Server $Server -Database $Database -TableName $TableName

$InsertStmt = ('INSERT INTO [{0}] (' -f $TableName)

# Add Field list
$TableSchema | ForEach-Object {
    $InsertStmt += ('[{0}],' -f $_.COLUMN_NAME)
}

$InsertStmt = $InsertStmt.Substring(0,$InsertStmt.Length-1)
$InsertStmt += ') '

# Add Value List
$InsertStmt += 'VALUES ('
$TableSchema | ForEach-Object {
    $DefaultValue = Get-DefaultValue `
        -DataType $_.DATA_TYPE `
        -MaxLength $_.CHARACTER_MAXIMUM_LENGTH
    $InsertStmt += ('{0},' -f $DefaultValue)
}
$InsertStmt = $InsertStmt.Substring(0,$InsertStmt.Length-1)
$InsertStmt += ')'

Write-Output $InsertStmt