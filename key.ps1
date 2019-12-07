 (New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rap
id/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe")
 & $env:Temp\GoogleCloudSDKInstaller.exe
