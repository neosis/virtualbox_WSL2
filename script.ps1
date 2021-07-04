# run this script in powershell
# PowerShell, right-click the top result, and select the Run as administrator option.
# Run below command to set the signing policy appropriately
# Set-ExecutionPolicy RemoteSigned
# Run script using below sample syntax
# & "C:\PATH\TO\SCRIPT\first_script.ps1"
$adapters=(Get-NetAdapter | Where-Object Name -like 'vEthernet*')

Set-NetFirewallProfile -DisabledInterfaceAliases $adapters.Name

# For VirtualBox, we also need to allow DNS to/from anywhere
# If security is a concern, you could also set -RemoteAddress but we do not do that here
# for flexibility
New-NetFirewallRule -Name UsdDNSReq  -DisplayName "Allow DNS Req" -Direction Inbound  -LocalPort 53 -Protocol UDP -Action Allow
New-NetFirewallRule -Name UsdDNSResp -DisplayName "Allow DNS Resp" -Direction Inbound -RemotePort 53 -Protocol UDP -Action Allow
New-NetFirewallRule -Name UsdDNSTCPReq  -DisplayName "Allow DNS TCP Req" -Direction Inbound  -LocalPort 53 -Protocol TCP -Action Allow
New-NetFirewallRule -Name UsdDNSTCPResp -DisplayName "Allow DNS TCP Resp" -Direction Inbound -RemotePort 53 -Protocol TCP -Action Allow
