@echo off
REM This script is to automate instructions for fixing Print Preview errors in Chrome/Chromium
REM Script Version 1.0 2024-08-30

REM Instructions: Place this file in the same folder as chrlauncher.exe, or chrome.exe

REM Start of comment block Versions
	REM How-to comment block https://www.robvanderwoude.com/comments.php
	GOTO Versions
	App Versions tested:
		https://github.com/henrypp/chrlauncher/releases/tag/v.2.6
	
	Windows Versions tested:
		Windows 10
		Windows 11
:Versions
	REM See above. Ends comment block Versions



:Primary
	REM https://issues.chromium.org/issues/339994760#comment28
	REM icacls /path/to/portable/chrome/ /grant "ALL APPLICATION PACKAGES:(OI)(CI)(RX)"
	REM icacls c:\dir_to_chrome /grant *S-1-15-2-2:(OI)(CI)(RX)
	@echo on
	icacls ./. /grant *S-1-15-2-2:(OI)(CI)(RX)
	@echo off
	REM Works
	
	:Nuclear
		REM Delete above line of text to run Nuclear
		REM https://issues.chromium.org/issues/339994760#comment28
		REM icacls /path/to/portable/chrome/ /grant "ALL APPLICATION PACKAGES:(OI)(CI)(RX)"
		GOTO Alternative
			@echo on
			icacls ./. /grant "ALL APPLICATION PACKAGES:(OI)(CI)(RX)"
			@echo off
			REM Works
		REM Delete below line of text to run Nuclear
		:Alternative

:Secondary
REM https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md
REM icacls %USERPROFILE%/.cache/puppeteer/chrome /grant *S-1-15-2-1:(OI)(CI)(RX)

	GOTO Alternate
		REM Delete above line of text to run Secondary
		echo on
		icacls ./. /grant *S-1-15-2-1:(OI)(CI)(RX)
		echo off
		REM Works
		REM Delete below line of text to run Secondary
	:Alternate

pause
