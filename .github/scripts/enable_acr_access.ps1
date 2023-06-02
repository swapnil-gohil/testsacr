$Ip1=(Invoke-WebRequest -uri "http://ifconfig.me/ip" -DisableKeepAlive -UseBasicParsing).Content
If(!([string]::IsNullOrEmpty($Ip1))){$githubPublicIp=$Ip1}
$Ip2=(Invoke-WebRequest -uri "https://api.ipify.org/" -DisableKeepAlive -UseBasicParsing).Content
If(!([string]::IsNullOrEmpty($Ip2))){$githubPublicIp=$Ip2}
az acr network-rule add -n testsacr --ip-address $githubPublicIp
