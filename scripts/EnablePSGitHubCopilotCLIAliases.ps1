# EnablePSGitHubCopilotCLIAliases.ps1

$profileContent = @"
Import-Module -Name PSGitHubCopilotCLI
"@

$profilePath = $PROFILE

if (-not (Test-Path -Path $profilePath)) {
    New-Item -Path $profilePath -ItemType File -Force
}

$existingProfileContent = Get-Content -Path $profilePath -Raw

if (-not $existingProfileContent.Contains($profileContent)) {
    Add-Content -Path $profilePath -Value $profileContent
}
 