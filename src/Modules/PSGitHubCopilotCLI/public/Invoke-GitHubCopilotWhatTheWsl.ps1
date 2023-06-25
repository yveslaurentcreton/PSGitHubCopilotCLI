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
function Invoke-GitHubCopilotWhatTheWsl {
    param(
        [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
        [string[]]$Query
    )

    # Join the args to form a single input string
    $inputString = [string]::Join(" use wsl to ", $Query)
    $inputString += " "

    # Create a temporary file to store the output
    $tmpFile = New-TemporaryFile

    # Get the path to the node executable
    $nodeFolder = (Split-Path -Parent (Get-Command -Name "node").Path)
    $copilotCliPath = Join-Path -Path $nodeFolder -ChildPath "node_modules\@githubnext\github-copilot-cli\cli.js"

    # Generate command to call the Copilot CLI based on node vs npm
    if (Test-Path -Path $copilotCliPath) {
        $copilotCommand = "node $copilotCliPath"
    }
    else {
        $copilotCommand = 'github-copilot-cli'
    }

    # Call the Copilot CLI directly or using node and store the output in the temporary file
    & $copilotCommand what-the-shell $inputString --shellout $tmpFile

    # Check if the command was successful
    if ($?) {
        # Read the contents of the temporary file and execute the command
        $fixedCmd = Get-Content -Path $tmpFile
        Invoke-Expression -Command $fixedCmd
    } else {
        Write-Host "Apologies! Extracting command failed"
    }

    # Remove the temporary file
    Remove-Item -Path $tmpFile.FullName
}

# Set the alias for the function
Set-Alias -Name "wsl?" -Value "Invoke-GitHubCopilotWhatTheWsl"

# Export the function and its aliases
Export-ModuleMember -Function "Invoke-GitHubCopilotWhatTheWsl"
Export-ModuleMember -Alias "wsl?"