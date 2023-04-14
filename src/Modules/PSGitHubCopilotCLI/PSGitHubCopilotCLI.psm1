$publicFunctions = Get-ChildItem -Path $PSScriptRoot\public\*.ps1 -Exclude *.tests.ps1, *profile.ps1 -ErrorAction SilentlyContinue
$privateFunctions = Get-ChildItem -Path $PSScriptRoot\private\*.ps1 -Exclude *.tests.ps1, *profile.ps1 -ErrorAction SilentlyContinue

$allFunctions = $publicFunctions + $privateFunctions

foreach ($function in $allFunctions) {
    . $function.FullName
}
