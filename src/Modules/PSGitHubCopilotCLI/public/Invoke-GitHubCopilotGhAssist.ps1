<#
.SYNOPSIS
    Invokes the GitHub Copilot CLI's gh-assist function.

.DESCRIPTION
    The Invoke-GitHubCopilotGhAssist function runs the gh-assist function from the GitHub Copilot CLI.
    It takes the user's input, calls the Copilot CLI, and then executes the command returned by the Copilot CLI.

.PARAMETER Query
    A variable-length argument list representing the user's input for the gh-assist function.

.EXAMPLE
    Invoke-GitHubCopilotGhAssist create a new repository named "my-new-repo"
#>
function Invoke-GitHubCopilotGhAssist {
    param(
        [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
        [string[]]$Query
    )

    # Join the args to form a single input string
    $inputString = [string]::Join(" ", $Query)

    # Create a temporary file to store the output
    $tmpFile = New-TemporaryFile

    # Call the Copilot CLI using node and store the output in the temporary file
    & "node" "C:\Program Files\nodejs\node_modules\@githubnext\github-copilot-cli\cli.js" gh-assist $inputString --shellout $tmpFile

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
Set-Alias -Name "gh?" -Value "Invoke-GitHubCopilotGhAssist"

# Export the function and its aliases
Export-ModuleMember -Function "Invoke-GitHubCopilotGhAssist"
Export-ModuleMember -Alias "gh?"
