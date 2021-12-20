function Get-TableSchema {
    param(
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

    $Sql = (
        'SELECT
            COLUMN_NAME,
            DATA_TYPE,
            ISNULL(CHARACTER_MAXIMUM_LENGTH,0) AS CHARACTER_MAXIMUM_LENGTH
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE
            DATA_TYPE != ''timestamp'' AND
            TABLE_NAME = ''{0}''') -f $TableName

    $TableFields = Invoke-Sqlcmd `
        -ServerInstance $Server `
        -Database $Database `
        -Query $Sql

    return $TableFields
}