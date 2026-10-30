$ErrorActionPreference = 'Stop'

$versionErrorMessage = 'The Entity Framework Core Package Manager Console Tools require Windows PowerShell 3.0 or ' +
    'higher. Install Windows Management Framework 3.0, restart Visual Studio, and try again. https://aka.ms/wmf3download'

<#
.SYNOPSIS
    Adds a new migration.

.DESCRIPTION
    Adds a new migration.

.PARAMETER Name
    The name of the migration.

.PARAMETER OutputDir
    The directory to put files in. Paths are relative to the project directory. Defaults to "Migrations".

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.PARAMETER Namespace
    The namespace to use. Matches the directory by default.

.PARAMETER Args
    Arguments passed to the application.

.LINK
    Remove-Migration
    Update-Database
    about_EntityFrameworkCore
#>
function Add-Migration(
    $Name,
    $OutputDir,
    $Context,
    $Project,
    $StartupProject,
    $Namespace,
    $Args)
{
    WarnIfEF6 'Add-Migration'
    throw $UpdatePowerShell
}

<#
.SYNOPSIS
    Creates an executable to update the database.

.DESCRIPTION
    Creates an executable to update the database.

.PARAMETER Output
    The path of executable file to create.

.PARAMETER Force
    Overwrite existing files.

.PARAMETER SelfContained
    Also bundle the .NET runtime so it doesn't need to be installed on the machine.

.PARAMETER TargetRuntime
    The target runtime to bundle for.

.PARAMETER Configuration
    The configuration to use for the bundle.

.PARAMETER Framework
    The target framework. Defaults to the first one in the project.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.PARAMETER Args
    Arguments passed to the application.

.LINK
    Script-Migration
    Update-Database
    about_EntityFrameworkCore
#>
function Bundle-Migration(
    $Output,
    [switch] $Force,
    [switch] $SelfContained,
    $TargetRuntime,
    $Configuration,
    $Framework,
    $Context,
    $Project,
    $StartupProject,
    $Args)
{
    throw $UpdatePowerShell
}

<#
.SYNOPSIS
    Drops the database.

.DESCRIPTION
    Drops the database.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.PARAMETER Args
    Arguments passed to the application.

.LINK
    Update-Database
    about_EntityFrameworkCore
#>
function Drop-Database(
    $Context,
    $Project,
    $StartupProject,
    $Args)
{
    throw $UpdatePowerShell
}

function Enable-Migrations
{
    WarnIfEF6 'Enable-Migrations'
    Write-Warning 'Enable-Migrations is obsolete. Use Add-Migration to start using Migrations.'
}

<#
.SYNOPSIS
    Lists and gets information about available DbContext types.

.DESCRIPTION
    Lists and gets information about available DbContext types.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.PARAMETER Args
    Arguments passed to the application.

.LINK
    about_EntityFrameworkCore
#>
function Get-DbContext(
    $Context,
    $Project,
    $StartupProject,
    $Args)
{
    throw $UpdatePowerShell
}

<#
.SYNOPSIS
    Lists available migrations.

.DESCRIPTION
    Lists available migrations.

.PARAMETER Connection
    The connection string to the database. Defaults to the one specified in AddDbContext or OnConfiguring.

.PARAMETER NoConnect
    Don't connect to the database.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.PARAMETER Args
    Arguments passed to the application.

.LINK
    Add-Migration
    Remove-Migration
    Update-Database
    about_EntityFrameworkCore
#>
function Get-Migration(
    $Connection,
    [switch] $NoConnect,
    $Context,
    $Project,
    $StartupProject,
    $Args)
{
    throw $UpdatePowerShell
}

<#
.SYNOPSIS
    Removes the last migration.

.DESCRIPTION
    Removes the last migration.

.PARAMETER Force
    Revert the migration if it has been applied to the database.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.PARAMETER Args
    Arguments passed to the application.

.LINK
    Add-Migration
    Get-Migration
    about_EntityFrameworkCore
#>
function Remove-Migration(
    [switch] $Force,
    $Context,
    $Project,
    $StartupProject,
    $Args)
{
    throw $UpdatePowerShell
}

<#
.SYNOPSIS
    Scaffolds a DbContext and entity types for a database.

.DESCRIPTION
    Scaffolds a DbContext and entity types for a database.

.PARAMETER Connection
    The connection string to the database.

.PARAMETER Provider
    The provider to use. (E.g. Microsoft.EntityFrameworkCore.SqlServer)

.PARAMETER OutputDir
    The directory to put files in. Paths are relative to the project directory.

.PARAMETER ContextDir
    The directory to put the DbContext file in. Paths are relative to the project directory.

.PARAMETER Context
    The name of the DbContext. Defaults to the database name.

.PARAMETER Schemas
    The schemas of tables and views to generate entity types for. All tables and views in the schemas will be included in the model, even if they are not explicitly included with the 'Tables' parameter.

.PARAMETER Tables
    The tables and views to generate entity types for. Tables or views in a specific schema can be included using the 'schema.table' or 'schema.view' format.

.PARAMETER DataAnnotations
    Use attributes to configure the model (where possible). If omitted, only the fluent API is used.

.PARAMETER UseDatabaseNames
    Use table, view, sequence, and column names directly from the database.

.PARAMETER Force
    Overwrite existing files.

.PARAMETER NoOnConfiguring
    Don't generate DbContext.OnConfiguring.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.PARAMETER Namespace
    The namespace to use. Matches the directory by default.

.PARAMETER ContextNamespace
    The namespace of the DbContext class. Matches the directory by default.

.PARAMETER NoPluralize
    Don't use the pluralizer.

.PARAMETER Args
    Arguments passed to the application.

.LINK
    about_EntityFrameworkCore
#>
function Scaffold-DbContext(
    $Connection,
    $Provider,
    $OutputDir,
    $ContextDir,
    $Context,
    $Schemas,
    $Tables,
    [switch] $DataAnnotations,
    [switch] $UseDatabaseNames,
    [switch] $Force,
    [switch] $NoOnConfiguring,
    $Project,
    $StartupProject,
    $Namespace,
    $ContextNamespace,
    [switch] $NoPluralize,
    $Args)
{
    throw $UpdatePowerShell
}

<#
.SYNOPSIS
    Generates a SQL script from the DbContext. Bypasses any migrations.

.DESCRIPTION
    Generates a SQL script from the DbContext. Bypasses any migrations.

.PARAMETER Output
    The file to write the result to.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.PARAMETER Args
    Arguments passed to the application.

.LINK
    about_EntityFrameworkCore
#>
function Script-DbContext(
    $Output,
    $Context,
    $Project,
    $StartupProject,
    $Args)
{
    throw $UpdatePowerShell
}

<#
.SYNOPSIS
    Generates a SQL script from migrations.

.DESCRIPTION
    Generates a SQL script from migrations.

.PARAMETER From
    The starting migration. Defaults to '0' (the initial database).

.PARAMETER To
    The target migration. Defaults to the last migration.

.PARAMETER Idempotent
    Generate a script that can be used on a database at any migration.

.PARAMETER NoTransactions
    Don't generate SQL transaction statements.

.PARAMETER Output
    The file to write the result to.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.PARAMETER Args
    Arguments passed to the application.

.LINK
    Update-Database
    Get-Migration
    about_EntityFrameworkCore
#>
function Script-Migration(
    $From,
    $To,
    [switch] $Idempotent,
    [switch] $NoTransactions,
    $Output,
    $Context,
    $Project,
    $StartupProject,
    $Args)
{
    throw $UpdatePowerShell
}

<#
.SYNOPSIS
    Updates the database to a specified migration.

.DESCRIPTION
    Updates the database to a specified migration.

.PARAMETER Migration
    The target migration. If '0', all migrations will be reverted. Defaults to the last migration.

.PARAMETER Connection
    The connection string to the database. Defaults to the one specified in AddDbContext or OnConfiguring.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.PARAMETER Args
    Arguments passed to the application.

.LINK
    Script-Migration
    about_EntityFrameworkCore
#>
function Update-Database(
    $Migration,
    $Connection,
    $Context,
    $Project,
    $StartupProject,
    $Args)
{
    WarnIfEF6 'Update-Database'
    throw $UpdatePowerShell
}

function WarnIfEF6($cmdlet)
{
    if (Get-Module 'EntityFramework6')
    {
        Write-Warning "Both Entity Framework Core and Entity Framework 6 are installed. The Entity Framework Core tools are running. Use 'EntityFramework6\$cmdlet' for Entity Framework 6."
    }
    elseif (Get-Module 'EntityFramework')
    {
        Write-Warning "Both Entity Framework Core and Entity Framework 6 are installed. The Entity Framework Core tools are running. Use 'EntityFramework\$cmdlet' for Entity Framework 6."
    }
}

# SIG # Begin signature block
# MIInRgYJKoZIhvcNAQcCoIInNzCCJzMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA+/BC9SKfXUJ35
# 6/bDEMadNtuRo3kV5rHh9kcXEEUdxqCCDLowggX1MIID3aADAgECAhMzAAACHU0Z
# yE7XD1dIAAAAAAIdMA0GCSqGSIb3DQEBCwUAMFcxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBD
# b2RlIFNpZ25pbmcgUENBIDIwMjQwHhcNMjYwNDE2MTg1OTQzWhcNMjcwNDE1MTg1
# OTQzWjB0MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYD
# VQQDExVNaWNyb3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IB
# DwAwggEKAoIBAQDQvewXxx9gZZFC6Ys1WBay8BJ8kGA4JQnH5CMafqOASlTpK9H8
# o5ZXTXt0caVQTNMUPt445wXYD+dFtaKWTwDn1I52oUSrC9vJin1Gsqt+zyKJL5Dg
# 3eQXbQNR61DmMy20GLTIO3SFed9Rfi/ophgCLGFLDR3r0KvHjwMb/jYWS0celV/4
# Lz27LfAekm8v9E5IXaeiXbAUYZKK090n4CVl3JBtbN+9DtI9SNu/yjvozW52/u7R
# X/Ttpa/KDlpuokZ+Zcbvmtd9ur9gFLvZzh41o9MsE/clQtdaFWGvuo6Jua/ntpgk
# ey3E5/vBFe+MJPG6phdnuo6r57ZudCudiI1bAgMBAAGjggGbMIIBlzAOBgNVHQ8B
# Af8EBAMCB4AwHwYDVR0lBBgwFgYKKwYBBAGCN0wIAQYIKwYBBQUHAwMwHQYDVR0O
# BBYEFH6QuMwqcPG0hQlQ6c5jCtTTLrVeMEUGA1UdEQQ+MDykOjA4MR4wHAYDVQQL
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xFjAUBgNVBAUTDTIzMDAxMis1MDc1NTkw
# HwYDVR0jBBgwFoAUf1k/VCHarU/vBeXmo9ctBpQSCDEwYAYDVR0fBFkwVzBVoFOg
# UYZPaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0
# JTIwQ29kZSUyMFNpZ25pbmclMjBQQ0ElMjAyMDI0LmNybDBtBggrBgEFBQcBAQRh
# MF8wXQYIKwYBBQUHMAKGUWh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMv
# Y2VydHMvTWljcm9zb2Z0JTIwQ29kZSUyMFNpZ25pbmclMjBQQ0ElMjAyMDI0LmNy
# dDAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4ICAQBKTbYOjzwTG/DXGaz9
# s6+fQeaTtDcFmMY+5UyVFCyj7Pv+5i37qfX8lSL/tBIfYQfWsMuBQlfZurJD6r4H
# VJ2CeH+1fgiq8dcHdVKoZ3Sa2qXoX3cq9iS8cVb06B7+5/XJ7I0OxHH9fDsvJ3T3
# w5V/ZtAIFmLrl+P0CtG+92uzRsn0nTbdFjOkLMLWPLAU3THohKRlSEMgFJpPkm5n
# 5UAZ35xX6FWCrDLsSKb555bTifwa8mJBwdlof0bmfYidH+dxZ1FdDxvLnNl9zeKs
# A4kejaaIqqIPguhwAti5Ql7BlTNoJNwxCvBmqW2MQLnCkYN/VVUsR3V2x/rcTNzo
# Bf/Z/SpROvdaA2ZOOd1uioXJt3tdLQ7vHpqpib0KfWr/FWXW10q38VxfCnRQBqzb
# SuztR7nEMuzX7Ck+B/XaPDXd1qh72+QYyB0Z2VzWmO9zsnb9Uq/dwu8LGeQqnyu6
# 7SDGACvnXii2fb9+US492VTnXSnFKyqwgzUyFMtZK1/sHYTv6bG4TtQUygQxTN+Z
# V+aJIlKO2MqZ7bKrAnOzS9m6NgoTdWOq11bTOZwKlIEV/EhV9SWkDmdpR/hPPT2v
# 6TEj4F8PT/zHjRezIU5c/DGlt/VhY/pK0XkJtEyMmmS1BMtjU/rqBZVMIm3dnxQs
# /TBByr+Cf8Z1r7aifQVQ+WSqzjCCBr0wggSloAMCAQICEzMAAAA5O7Y3Gb8GHWcA
# AAAAADkwDQYJKoZIhvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpX
# YXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRl
# IEF1dGhvcml0eSAyMDExMB4XDTI0MDgwODIwNTQxOFoXDTM2MDMyMjIyMTMwNFow
# VzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEo
# MCYGA1UEAxMfTWljcm9zb2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAyNDCCAiIwDQYJ
# KoZIhvcNAQEBBQADggIPADCCAgoCggIBANgBnB7jOMeqlRYHNa265v4IY9fH8TKh
# emHfPINe1gpLaV3dhg324WwH06LcHbpnsBukCDNitryo0dtS/EW6I/yEL/bLSY8h
# KpbfQuWusBPr9qazYcDxCW/qnjb5JsI1s8bNOg3bVATvQVL4tcf03aTycsz8QeCd
# M0l/yHRObJ9QqazM1r6VPEOJ7LL+uEEb73w6QCuhs89a1uv1zerOYMnsneRRwCbp
# yW11IcggU0cRKDDq1pjVJzIbIF6+oiXXbReOsgeI8zu1FyQfK0fVkaya8SmVHQ/t
# Of23mZ4W9k0Ri22QW9p3UgSC5OUDktKxxcCmGL6tXLfOGSWHIIV4YrTJTT6PNty5
# REojHJuZHArkF9VnHTERWoTjAzfI3kP+5b4alUdhgAZ7ttOu1bVnXfHaqPYl2rPs
# 20ji03LOVWsh/radgE17es5hL+t6lV0eVHrVhsssROWJuz2MXMCt7iw7lFPG9LXK
# Gjsmonn2gotGdHIuEg5JnJMJVmixd5LRlkmgYRZKzhxSCwyoGIq0PhaA7Y+VPct5
# pCHkijcIIDm0nlkK+0KyepolcqGm0T/GYQRMhHJlGOOmVQop36wUVUYklUy++vDW
# eEgEo4s7hxN6mIbf2MSIQ/iIfMZgJxC69oukMUXCrOC3SkE/xIkgpfl22MM1itkZ
# 35nNXkMolU1lAgMBAAGjggFOMIIBSjAOBgNVHQ8BAf8EBAMCAYYwEAYJKwYBBAGC
# NxUBBAMCAQAwHQYDVR0OBBYEFH9ZP1Qh2q1P7wXl5qPXLQaUEggxMBkGCSsGAQQB
# gjcUAgQMHgoAUwB1AGIAQwBBMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU
# ci06AjGQQ7kUBU7h6qfHMdEjiTQwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
# bC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0MjAx
# MV8yMDExXzAzXzIyLmNybDBeBggrBgEFBQcBAQRSMFAwTgYIKwYBBQUHMAKGQmh0
# dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0MjAx
# MV8yMDExXzAzXzIyLmNydDANBgkqhkiG9w0BAQwFAAOCAgEAFJQfOChP7onn6fLI
# MKrSlN1WYKwDFgAddymOUO3FrM8d7B/W/iQ6DxXsDn7D5W4wMwYeLystcEqfkjz4
# NURRgazyMu5yRzQh4LqjA4tStTcJh1opExo7nn5PuPBYnbu0+THSuVHTe0VTTPVh
# ily/piFrDo3axQ9P4C+Ol5yet+2gTfekICS5xS+cYfSIvgn0JksVBVMYVI5QFu/q
# hnLhsEFEUzG8fvv0hjgkO+lkpV9ty6GkN4vdnd7ya6Q6aR9y34aiM1qmxaxBi6OU
# nyNl6fkuun/diTFnYDLTppOkr/mg5WSfCiDVMNCxtj4wPKC5OmHm1DQIt/MNokbb
# H3UGsFP1QbzsLocuSqLCvH09Io3fDPTmscR9Y75G4qX7RTX8AdBPo0I6OEojf39z
# uFZt0qOHm65YWQE69cZM2ueE1MB05dNNgHK9gTE7zKvK/fg8B2qjW88MT/WF5V5u
# vZGtqa9FSL2RazArA+rDPuf6JGYz4HpgMZHB4S6szWSKYBv0VisCzfxgeU+dquXW
# 9bd0auYlOB58DPcOYKdc3Se94g+xL4pcEhbB54JOgAkwYTu/9dLeH2pDqeJZAABV
# DWRQCaXfO5LgyKwKCLYXpigrZYCjUSBcr+Ve8PFWMhVTQl0v4q8J/AUmQN5W4n10
# 1cY2L4A7GTQG1h32HHAvfQESWP0xghniMIIZ3gIBATBuMFcxCzAJBgNVBAYTAlVT
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jv
# c29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMjQCEzMAAAIdTRnITtcPV0gAAAAAAh0w
# DQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYK
# KwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIA9nfTya
# ZT2b6QZy9jZINA417ooW/5RkJ+d2iUZwJz0bMEIGCisGAQQBgjcCAQwxNDAyoBSA
# EgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20w
# DQYJKoZIhvcNAQEBBQAEggEAC11oAZ3albndhrQddFv/bIZFPdavPGH4TIU8k0+E
# BrOsIARHHomBfWYpaDALhDsJTfw/x4O6UrqF7eNpdvO/sYh5ZVxBha94jr0FFr3E
# SHREEL0/utNF8Ly2OeUDTWNYIqixfdkqkO6hOpuzcV/VQsf9Ws79maIC9J6pYzQm
# IW5AC3J4SdWZ9YXaMH2KlJS0ngmBafldb47OA9GqPjCvyuEA48DydboN2gMzjdsB
# GUGyuhUc8s75veoO+qqfp05EVYsqopALUZdujc4HDoLzQntO5yQPr9KpVSWE/oyo
# MZQsepT2iAjAeAcK33H3NoC3p/lXZUlNs7WuKkSb7qGryKGCF5QwgheQBgorBgEE
# AYI3AwMBMYIXgDCCF3wGCSqGSIb3DQEHAqCCF20wghdpAgEDMQ8wDQYJYIZIAWUD
# BAIBBQAwggFSBgsqhkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGEWQoD
# ATAxMA0GCWCGSAFlAwQCAQUABCB3WArRjYOIJxsMosVclDYRFtGXusnFe2zeW8T+
# biJTkQIGaterTiVmGBMyMDI2MTAyMzA0MTk0Ny43MDhaMASAAgH0oIHRpIHOMIHL
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxN
# aWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRT
# UyBFU046QTAwMC0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFNlcnZpY2WgghHqMIIHIDCCBQigAwIBAgITMwAAAiu7AFD/TTuaoQABAAAC
# KzANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
# Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAe
# Fw0yNjAyMTkxOTQwMTFaFw0yNzA1MTcxOTQwMTFaMIHLMQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmlj
# YSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046QTAwMC0wNUUw
# LUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIi
# MA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCX3mi6OD3syUqQm4QqgkrKPbcs
# K/Qx3fYctL8+VM1uOY3booi5GxwauTgQf6JFHITToxS7gjqKlK8OFLzL6UTl0jxE
# K5t6DuOcgJXdvutimoTlOS0C3kyITXBAXoj/gp6hRR9z6WRip1Ktkilb3dJXCjQq
# T9P2Cuujr+Vz8r+Z+jDl09ji/ic/4G34r3mVwjs//Gnx9Pu31V8rXFicNiAzxpub
# awpbd8pqfzlWT2vnG3kF9l6MiREbvJ3XHLUwHQsh0t/TrSFx/s/yCqpJWYJ6oClG
# 70tvsFH0aRP8wB4cP/CFa2ILvk26i3OcJBl+pqKjHTSBy9mvwTPEDlnzco0Nt8R6
# pSPTXZgBsscHhoKfC0WQmOzY2keXbAmRTcZMyXz5v/AJbmoI0y07Bazvt5NkXddG
# 9TErQWwtsFyIKrElDgWfHeCoTu1wu2ciD3dK72z3ca2gzoEDxT2j9BXIUKaiTzTd
# QPRsAMaO3dU0zaGwMMlwtSJyDh14YEgZoUu5vS8MugMqdrNjphyL65yKhjpAWbhY
# kIHO/0uZju95tP8zZNqXIRh4tdfWHJPATn9r+cxkyuh2x0VLdfx1lmK9X3NjH0Nt
# gAs5JB/wOlkyuudxmFTfWVyRrL37ispOZ8aPAFgvyR6cNTkGpkFo35JRjciNmZiU
# 4qT9Uty+V5gudFk1jwIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFD4WjuQTUJbtbd3j
# mvZku0FZ2eU2MB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1Ud
# HwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3Js
# L01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggr
# BgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNv
# bS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIw
# MTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgw
# DgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQDO/CKsciEM8kr1fqH4
# TlfT66ENoTjxXw810pyEq0PdrgLwfgT3x+1gz7CQHtUdevqMQ5qHyDLhm6pT911C
# YkGN+6g+MU7fMYTr6d3SxieJwBIoWkfR4g7SitGzMKU465KEYejfddoUgovC/xcR
# paALO5p3/A248ByhJiMttBQNDtsT/HaCFwRFCURby/f8c1kky8F8xkCXFz+/MtZ5
# d1lWFjwOI2geZHWq9XihDOgee5nS2koo5V6n8XG220UTevVf+pgmpIH71XKDVIYT
# GGZJs6yPlfJ2aXqw1ME4NR6okNsY3P1M31H6DMYRfJGNBNep595kXGh3YzA3cCiy
# g+jmJ58h/fTvjngIpuUFfODpDjFx0ic1YoLANxhCF3RhS9qYM7K40NEhKshYuaAk
# IG2XBKYig3r/0/b0sjvjBws55AYonMm3A8qcX/6k9Vfc0mv9dtonHuWGfA2b+qE2
# qpCnhzGbdDHq7iOSZEw01nNupAMf1c41k9IoTQ2z3iw6w4ZZoLOyg4TKMbp1krpT
# 4trip/y30Cv5khyqCDNqaXQpBkOYON8LgtoQ3amVOX7ix5jdrnx/vUxTUSigXvrW
# dL7Uk8kpmS0zto2Toy7aT5oBzCTvfj9iJ/BN/E1vhFBkhJCvZ7PVvsMSnTTmkx2F
# al2lVkztuAI44fD/uyLJdaMQSzCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkA
# AAAAABUwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpX
# YXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRl
# IEF1dGhvcml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVow
# fDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMd
# TWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUA
# A4ICDwAwggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX
# 9gF/bErg4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1q
# UoNEt6aORmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8d
# q6z2Nr41JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byN
# pOORj7I5LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2k
# rnopN6zL64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4d
# Pf0gz3N9QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgS
# Uei/BQOj0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8
# QmguEOqEUUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6Cm
# gyFdXzB0kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzF
# ER1y7435UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQID
# AQABo4IB3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQU
# KqdS/mTEmr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1
# GelyMFwGA1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0
# dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0
# bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMA
# QTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbL
# j+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1p
# Y3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0w
# Ni0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIz
# LmNydDANBgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwU
# tj5OR2R4sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN
# 3Zi6th542DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU
# 5HhTdSRXud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5
# KYnDvBewVIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGy
# qVvfSaN0DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB6
# 2FD+CljdQDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltE
# AY5aGZFrDZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFp
# AUR+fKFhbHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcd
# FYmNcP7ntdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRb
# atGePu1+oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQd
# VTNYs6FwZvKhggNNMIICNQIBATCB+aGB0aSBzjCByzELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2Eg
# T3BlcmF0aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOkEwMDAtMDVFMC1E
# OTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEw
# BwYFKw4DAhoDFQAJrD90ykHpo/0AGb7lmwvsCtqROaCBgzCBgKR+MHwxCzAJBgNV
# BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4w
# HAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29m
# dCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA7oTMDjAiGA8y
# MDI2MTAyMjE3NTMxOFoYDzIwMjYxMDIzMTc1MzE4WjB0MDoGCisGAQQBhFkKBAEx
# LDAqMAoCBQDuhMwOAgEAMAcCAQACAgDsMAcCAQACAhjiMAoCBQDuhh2OAgEAMDYG
# CisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEA
# AgMBhqAwDQYJKoZIhvcNAQELBQADggEBAF37+E7cVB+3v4HDd53VyDxIv6QkkBR4
# GCxAb5lCQw+CDEtOdiiZlH1HxKT+Zmf6xEEuXkPQj9nt70Tu70kp00vCPG2ZSF5V
# dwUno8euet53UJjjqjXOFbz1KSyyLAvGJ3Z6SXA+VZcpmwvj+CxwNILg0pVHEj6E
# mPHO2SDcF/ODkRxn1jWnrFnknKQqSjELBhcqt+bjZketSFW+LCMYZIvXjVcc0YjK
# 7OikkptE4vh6UIujePKQwwDIl1/p1348bPnvmc8b5VXBG7htjjjSrXPw+P4DJbFd
# +7JIoH+JCIakvumwXStW8AqV5oLvQ69fks2GeOulH+R3b3cCTcBvFGIxggQNMIIE
# CQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYw
# JAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAiu7AFD/
# TTuaoQABAAACKzANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqG
# SIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCDTHrPpMueykYJznSqhIGNBAZ1IItgH
# 4IC19/vC9pRG8TCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIHIOI/Q/kFft
# YA+M2OY+1Bx3ajBD6/WDAtPT2vFkv25SMIGYMIGApH4wfDELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoT
# FU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUt
# U3RhbXAgUENBIDIwMTACEzMAAAIruwBQ/007mqEAAQAAAiswIgQgnnByp62rRh9c
# 6jhC4fmqM2HfZERUzTEWPESeNMoERZEwDQYJKoZIhvcNAQELBQAEggIAV1L0jO5l
# bRg3dGCfvAslYm79/08f6AGeB4mMgZRZd6t/2AabTdCL4gRV790+SK6cE3JNk/gt
# NNXKkhv0+GuwOluC11FyRVE7cnocoFcv2kDXGJ/rKPwqSDqd4E48Jv4KRM3wVFr0
# BI1ezQR6jBtmjYdgqVo/iueTtJUQj+DoQC96aiOJp1S8kMPLV57v/5CqF02eAuJH
# xh6oxQJyrHi8/6uQRnoMxAos1i0TZrX6eejGMnT1zOocV4DZzP6ACm5pSY3ty7s/
# 8K5GOKAUqAXfz0r/VS207suKyza05aQvqHRsxZ0NXlCi5OSPCWs4LjWJTLjSfaEr
# tCFaO/VF5iTYMNH4XfBIcHxhniaPW03xASd/RKVpiAJdH2lZ3uCKv2Fr538b+DH7
# f/b27fkmEjRDICh3cJbbwJ9/ir/2R/V4QTjXeaj3TFhJL5fAxJwiKWi0hyXEgMR4
# nyd55INJZvlawraTYJz+jhh/zsfrTp9JhcXDTLBfRE9KcvWINfhVryTWEMhPI9DN
# 0hDrOtuBJcpsEk89WZMnFhodOemqmbkTkQTdFK7HY6FDE77vd4cG54QhRaT7iiZZ
# 6ZvUsHqMYrx5JU8X8uwpC93uHNpRM+94X8GosgwxFjCCTVgwPsD73xaAtGpXu0FQ
# C0ZLIi2RhwuZ6iDfbXqMP1cO0QtNj7KZqmc=
# SIG # End signature block
