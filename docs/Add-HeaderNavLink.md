---
external help file: ClarityPS-help.xml
Module Name: ClarityPS
online version:
schema: 2.0.0
---

# Add-HeaderNavLink

## SYNOPSIS

## SYNTAX

```
Add-HeaderNavLink [-URL] <String> [-LinkTitle] <String> [-Active] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Adds Link Element

## EXAMPLES

### EXAMPLE 1
```
Add-HeaderNavLink -Title MyCard -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" -NewTab
```

## PARAMETERS

### -URL
Web URL for the link.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinkTitle
Title of the link in the HTML doc (user facing)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Active
Adds a property to highlight the link as active.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
### System.Boolean
## NOTES
No notes at this time.

## RELATED LINKS
