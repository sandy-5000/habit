Write-Host "`nConnected Android Devices:"
adb devices

$devices = adb devices | Where-Object { $_ -notmatch "List of devices attached" -and $_ -ne "" }

if ($devices.Count -eq 0) {
    Write-Host "No connected devices found."
} else {
    $firstDevice = ($devices -split "\s+")[0]
    Write-Host "`nInstalling APK on device: $firstDevice`n"
    adb -s $firstDevice install build/app/outputs/apk/release/app-release.apk
}
