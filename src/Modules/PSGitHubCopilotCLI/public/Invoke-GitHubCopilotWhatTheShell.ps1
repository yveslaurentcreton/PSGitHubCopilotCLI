<#
.SYNOPSIS
    Invokes the GitHub Copilot CLI's what-the-shell function.

.DESCRIPTION
    The Invoke-GitHubCopilotWhatTheShell function runs the what-the-shell function from the GitHub Copilot CLI.
    It takes the user's input, calls the Copilot CLI, and then executes the command returned by the Copilot CLI.

.PARAMETER Query
    A variable-length argument list representing the user's input for the what-the-shell function. The code that is
    generated should work on PowerShell on Windows (without quotes).

.EXAMPLE
    Invoke-GitHubCopilotWhatTheShell create a new folder called "my-folder"
#>
function Invoke-GitHubCopilotWhatTheShell {
    param(
        [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
        [string[]]$Query
    )

    $operatingSystem = Get-OperatingSystem

    # Join the args to form a single input string
    $inputString = [string]::Join(" ", $Query)
    $inputString += ". The command should be executable in PowerShell on $operatingSystem."

    # Create a temporary file to store the output
    $tmpFile = New-TemporaryFile

    # Call the Copilot CLI using node and store the output in the temporary file
    & "node" "C:\Program Files\nodejs\node_modules\@githubnext\github-copilot-cli\cli.js" what-the-shell $inputString --shellout $tmpFile

    # Check if the command was successful
    if ($?) {
        # Read the contents of the temporary file and execute the command
        $fixedCmd = Get-Content -Path $tmpFile
        & $fixedCmd
    } else {
        Write-Host "Apologies! Extracting command failed"
    }

    # Remove the temporary file
    Remove-Item -Path $tmpFile.FullName
}

# Set the alias for the function
Set-Alias -Name "??" -Value "Invoke-GitHubCopilotWhatTheShell"
Set-Alias -Name "wts" -Value "Invoke-GitHubCopilotWhatTheShell"

# Export the function and its aliases
Export-ModuleMember -Function "Invoke-GitHubCopilotWhatTheShell"
Export-ModuleMember -Alias "??"
Export-ModuleMember -Alias "wts"