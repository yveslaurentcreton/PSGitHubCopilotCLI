<#
.SYNOPSIS
    Invokes the GitHub Copilot CLI's git-assist function.

.DESCRIPTION
    The Invoke-GitHubCopilotGitAssist function runs the git-assist function from the GitHub Copilot CLI.
    It takes the user's input, calls the Copilot CLI, and then executes the command returned by the Copilot CLI.

.PARAMETER Query
    A variable-length argument list representing the user's input for the git-assist function.

.EXAMPLE
    Invoke-GitHubCopilotGitAssist commit all changes with a message "initial commit"
#>
function Invoke-GitHubCopilotGitAssist {
    param(
        [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
        [string[]]$Query
    )

    # Join the args to form a single input string
    $inputString = [string]::Join(" ", $Query)

    # Create a temporary file to store the output
    $tmpFile = New-TemporaryFile

    # Get the path to the node executable
    $nodeFolder = (Split-Path -Parent (Get-Command -Name "node").Path)
    $copilotCliPath = Join-Path -Path $nodeFolder -ChildPath "node_modules\@githubnext\github-copilot-cli\cli.js"

    # Call the Copilot CLI using node and store the output in the temporary file
    & "node" $copilotCliPath git-assist $inputString --shellout $tmpFile

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
Set-Alias -Name "git?" -Value "Invoke-GitHubCopilotGitAssist"

# Export the function and its aliases
Export-ModuleMember -Function "Invoke-GitHubCopilotGitAssist"
Export-ModuleMember -Alias "git?"