param(
	[String]$SqlTempDbFolderPath = "D:\SqlTemp\",
	[String]$SQLServiceDisplayName = "SQL Server (MSSQLSERVER)",
	[String]$SQLAgentServiceDisplayName = "SQL Server Agent (MSSQLSERVER)"
)

##Example Call:
#     & .\AddSqlTempAndStartSqlService.ps1
##


function EnsureTempDirectoryExists([String]$TempFolder)
{
    if (!(test-path -path $TempFolder)) {
        New-Item -ItemType directory -Path $TempFolder
    }
}

function StartSQLService([String]$ServiceName)
{
    $arrService = Get-Service -Name $ServiceName
    if ($arrService.Length -lt 1)
    {
        Write-Host "Can not find " $ServiceName
        return
    }

    if ($arrService.Status -ne "Running"){
    $ServiceStarted = $false}
    Else{$ServiceStarted = $true}
    write-host $arrService.status

    while ($ServiceStarted -ne $true){
        Start-Service $arrService.Name
        write-host $arrService.status
        write-host "Service started"
        Start-Sleep -seconds 10
        $arrService = Get-Service -Name $arrService.Name
        if ($arrService.Status -eq "Running"){
        $ServiceStarted = $true}
    }
}

EnsureTempDirectoryExists $SqlTempDbFolderPath
StartSQLService $SQLServiceDisplayName
StartSQLService $SQLAgentServiceDisplayName