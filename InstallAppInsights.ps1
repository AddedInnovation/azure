
param(	
	$key
)

function InstallAppInsights([String]$InstrumentationKey)
{
	Write-Information "Going to install application insights"
	Write-Information $key
	Mkdir C:\AppX$key   
}

InstallAppInsights $key
