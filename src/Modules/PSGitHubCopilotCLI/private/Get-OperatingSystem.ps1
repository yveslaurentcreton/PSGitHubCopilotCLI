<#
.SYNOPSIS
    Get-OperatingSystem returns the operating system on which the script is executed.

.DESCRIPTION
    Get-OperatingSystem is a function that determines whether a script is executed on Linux, macOS, or Windows.
    It returns the values Linux, Windows, or MacOS, based on the detected operating system.

.EXAMPLE
    Get-OperatingSystem
    This example shows how to call the function to determine the current operating system.
#>
function Get-OperatingSystem {
    [CmdletBinding()]
    [OutputType([string])]
    param()

    # Determine the operating system using the built-in $IsWindows, $IsLinux, and $IsMacOS variables
    if ($IsWindows) {
        return "Windows"
    } elseif ($IsLinux) {
        return "Linux"
    } elseif ($IsMacOS) {
        return "MacOS"
    } else {
        # If none of the predefined variables match, throw an exception
        throw "Unsupported operating system detected."
    }
}
