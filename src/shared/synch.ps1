$source = "C:\123046\course-code-hub\course-code-hub"
$target = "C:\123046\llmops-rtsrinivasan\src\shared\sync"

$scriptFolder = Split-Path -Parent $MyInvocation.MyCommand.Path

if ((Resolve-Path $source -ErrorAction Stop).Path -eq (Resolve-Path $scriptFolder -ErrorAction Stop).Path) {
    throw "The source directory cannot be the same as the script folder. Update the source path before running this script."
}

if ((Resolve-Path $source -ErrorAction Stop).Path -eq (Resolve-Path $target -ErrorAction Ignore).Path) {
    throw "The target directory cannot be the same as the source directory."
}

if ((Resolve-Path $scriptFolder -ErrorAction Stop).Path -eq (Resolve-Path $target -ErrorAction Ignore).Path) {
    throw "The target directory cannot be the same as the folder that contains this script."
}

Write-Host "Syncing files from $source to $target"
if (Test-Path $target) {
    Remove-Item -Path $target -Recurse -Force -ErrorAction Stop
}

New-Item -ItemType Directory -Path $target -Force | Out-Null
Copy-Item -Path (Join-Path $source '*') -Destination $target -Recurse -Force -ErrorAction Stop

Write-Host "Sync completed successfully."