﻿<#
.SYNOPSIS
	Sets the working directory to the user's downloads folder
.DESCRIPTION
	This PowerShell script changes the working directory to the user's downloads folder.
.EXAMPLE
	PS> ./cd-downloads
	📂C:\Users\Joe\Downloads
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz / License: CC0
#>

try {
	if ($IsLinux) {
		$Path = Resolve-Path "$HOME/Downloads"
	} else {
		$Path = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
	}
	if (-not(Test-Path "$Path" -pathType container)) {
		throw "Downloads folder at 📂$Path doesn't exist (yet)"
	}
	Set-Location "$Path"
	"📂$Path"
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
