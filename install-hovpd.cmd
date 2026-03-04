:: This script installs the Hyland OnBase Virtual Printer Driver
:: This script is designed to work with SCCM but can be ran as a stand alone install via a command prompt
:: This script assumes you have the required files.
:: https://docs.hyland.com/HVP/en_US/1.0/Print/Hyland_Virtual_Printer_Installation_Guide_1.0.x.pdf

SETLOCAL

@echo off
mode con:cols=85 lines=35
COLOR 0B

:: Import the Hyland Virtual Print certificates as a silent install will throw a security dialog box without it 
certutil -addstore "TrustedPublisher" vpd1.cer
timeout 10

certutil -addstore "TrustedPublisher" vpd2.cer
timeout 10

:: Virtual Printer Installation
START /WAIT msiexec /i "%~dp0Hyland OnBase Virtual Print Driver x64.msi" SPOOL="C:\OnBase Printer Spool" /qn
timeout 10

:: Return the exit code to SCCM
exit /B %EXIT_CODE%