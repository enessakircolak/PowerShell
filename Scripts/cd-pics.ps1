﻿<#
.SYNOPSIS
	Sets the working directory to the user's pictures folder
.DESCRIPTION
	This PowerShell script changes the working directory to the user's pictures folder.
.EXAMPLE
	PS> ./cd-pics
	📂/home/Joe/Pictures
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz / License: CC0
#>

try {
	if ($IsLinux) {
		$Path = Resolve-Path "$HOME/Pictures"
	} else {
		$Path = [Environment]::GetFolderPath('MyPictures')
	}
	if (-not(Test-Path "$Path" -pathType container)) {
		throw "Pictures folder at 📂$Path doesn't exist (yet)"
	}
	Set-Location "$Path"
	"📂$Path"
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
