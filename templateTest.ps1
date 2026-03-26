$TEMPLATE_NAME = "ChroMapperPluginTemplate"
$TEMPLATE_SHORT_NAME = "chromapperplugin"

function Check-ExitCode {
    param (
        [scriptblock]$scriptblock
    )
    & $scriptblock
    $exit_code = $LASTEXITCODE
    if ($exit_code -ne 0) {
        Write-Host
        Write-Host "[Notice] Something went wrong. Last exit code: $exit_code"
        Write-Host
    }
}

function Make-TestProject {
    param (
        [string]$project_name
    )

    $project_path = Join-Path $PSScriptRoot $project_name
    $project_already_exists = Test-Path $project_path
    if ($project_already_exists) {
        Remove-Item $project_path -Recurse
    }

    Check-ExitCode {
        dotnet new $TEMPLATE_SHORT_NAME -o $project_path --Author "Vainstains" @args
    }
}

Check-ExitCode {
    dotnet new install (Join-Path $PSScriptRoot $TEMPLATE_NAME) --force
}


Make-TestProject "NewTestPlugin"