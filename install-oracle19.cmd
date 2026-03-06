:: Oracle 19c 64bit installer
:: Assumes you have downloaded Oracle 19 and extracted it as WINDOWS.X64_193000_db_home
:: https://www.oracle.com/database/technologies/oracle19c-windows-downloads.html
:: Assumes you have generated a response file.
:: Run from the same directory as WINDOWS.X64_193000_db_home


SETLOCAL

echo Begining installation of Oracle 19c
echo Creating the oracle directory
:: Create the oracle folder
mkdir "C:\Oracle"

echo Copying the Oracle install directory to C:\Oracle
echo This will take some time, please be patient
:: Copy the oracle install directory to C:\Oracle
xcopy "WINDOWS.X64_193000_db_home\" C:\Oracle /E /H /C /I

::not necessary but sometimes ther can be a delay with older devices
timeout 60  

echo Setting the firewall rule to allow oracle
:: Allow oracle java fw rule (This prevents the fw popup that requires admin)
netsh advfirewall firewall add rule name="Allow Oracle" dir=in action=allow program="C:\oracle\jdk\jre\bin\java.exe" profile=domain

echo Installing Oracle 19c client
:: Run the oracle install
"C:\Oracle\setup.exe" -silent -nowait -waitforcompletion -force -responseFile "C:\Oracle\inventory\Scripts\oracle19.rsp"

echo Setting the appropriate permissions on the oracle directory
:: Set permissions on the oracle folder for authenticated users
icacls C:\Oracle /grant "authenticated users":f /T