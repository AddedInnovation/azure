
param(	
	$key
)

function InstallAppInsights([String]$InstrumentationKey)
{
    Install-PackageProvider Nuget –Force
    Install-Module –Name PowerShellGet –Force -AllowClobber
	Update-Module -Name PowerShellGet

    Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
    Install-Module -Name Az.ApplicationMonitor -AllowPrerelease -AcceptLicense

    Enable-ApplicationInsightsMonitoring -InstrumentationKey $InstrumentationKey -AcceptLicense -EnableInstrumentationEngine
}

InstallAppInsights $key
