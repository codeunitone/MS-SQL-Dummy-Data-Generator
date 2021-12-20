function Get-DefaultValue {
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $DataType,

        [int]
        $MaxLength
    )

    switch ($DataType) {
        'bigint' {
            $DefaultValue = $(Get-Random).ToString()
            return $DefaultValue
        }
        # 'numeric' {
        #     '?_?_?numeric?_?_?'
        # }
        # 'bit' {
        #     '?_?_?bit?_?_?'
        # }
        # 'smallint' {
        #     '?_?_?smallint?_?_?'
        # }
        # 'decimal' {
        #     '?_?_?decimal?_?_?'
        # }
        # 'smallmoney' {
        #     '?_?_?smallmoney?_?_?'
        # }
        'int' {
            $DefaultValue = $(Get-Random).ToString()
            return $DefaultValue
        }
        'tinyint' {
            $DefaultValue = '0'
            return $DefaultValue
        }
        # 'money' {
        #     '?_?_?money?_?_?'
        # }
        # 'float' {
        #     '?_?_?float?_?_?'
        # }
        # 'real' {
        #     '?_?_?real?_?_?'
        # }
        # 'date' {
        #     '?_?_?date?_?_?'
        # }
        # 'datetimeoffset' {
        #     '?_?_?datetimeoffset?_?_?'
        # }
        # 'datetime2' {
        #     '?_?_?datetime2?_?_?'
        # }
        # 'smalldatetime' {
        #     '?_?_?smalldatetime?_?_?'
        # }
        'datetime' {
            $DefaultValue = '''' + [string]$(Get-date -Format "yyyy-MM-dd HH:MM:ss.ms") + ''''
            return $DefaultValue
        }
        # 'time' {
        #     '?_?_?time?_?_?'
        # }
        'char' {
            # lowercase letters/numbers only
            $DefaultValue = '''' + $(-join ((48..57) + (97..122) | Foreach-Object {[char]$_} | Get-Random -count $MaxLength)) + ''''
            return $DefaultValue
        }
        'varchar' {
            # lowercase letters/numbers only
            $DefaultValue = '''' + $(-join ((48..57) + (97..122) | Foreach-Object {[char]$_} | Get-Random -count $MaxLength)) + ''''
            return $DefaultValue
        }
        'text' {
            # lowercase letters/numbers only
            $DefaultValue = '''' + $(-join ((48..57) + (97..122) | Foreach-Object {[char]$_} | Get-Random -count $MaxLength)) + ''''
            return $DefaultValue
        }
        'nchar' {
            # lowercase letters/numbers only
            $DefaultValue = '''' + $(-join ((48..57) + (97..122) | Foreach-Object {[char]$_} | Get-Random -count $MaxLength)) + ''''
            return $DefaultValue
        }
        'nvarchar' {
            # lowercase letters/numbers only
            $DefaultValue = '''' + $(-join ((48..57) + (97..122) | Foreach-Object {[char]$_} | Get-Random -count $MaxLength)) + ''''
            return $DefaultValue
        }
        'ntext' {
            # lowercase letters/numbers only
            $DefaultValue = '''' + $(-join ((48..57) + (97..122) | Foreach-Object {[char]$_} | Get-Random -count $MaxLength)) + ''''
            return $DefaultValue
        }
        # 'binary' {
        #     '?_?_?binary?_?_?'
        # }
        # 'varbinary' {
        #     '?_?_?varbinary?_?_?'
        # }
        # 'image' {
        #     '?_?_?image?_?_?'
        # }
        # 'cursor' {
        #     '?_?_?cursor?_?_?'
        # }
        # 'rowversion' {
        #     '?_?_?rowversion?_?_?'
        # }
        # 'hierarchyid' {
        #     '?_?_?hierarchyid?_?_?'
        # }
        # 'uniqueidentifier' {
        #     '?_?_?uniqueidentifier?_?_?'
        # }
        # 'sql_variant' {
        #     '?_?_?sql_variant?_?_?'
        # }
        # 'xml' {
        #     '?_?_?xml?_?_?'
        # }
        # 'Spatial Geometry Types' {
        #     '?_?_?Spatial Geometry Types?_?_?'
        # }
        # 'Spatial Geography Types' {
        #     '?_?_?Spatial Geography Types?_?_?'
        # }
        # 'table' {
        #     '?_?_?table?_?_?'
        # }
        Default {
            throw ('The data type <{0}> is not defined.' -f $DataType)
        }
    }
}