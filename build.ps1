$AppBundle = ".\build\app\outputs\bundle\release\app-release.aab"
$AppApks = ".\build\app\outputs\bundle\release\app-release.apks"

Write-Output "Buiding Android release."
flutter build appbundle
Write-Output "Buiding Android release: Complete"

Write-Output "Create APKs for device installation."
if (Test-Path $AppApks) {
    Remove-Item $AppApks
}
java -jar .\bundletool-all.jar build-apks --connected-device --bundle=$AppBundle --output=$AppApks
Write-Output "Create APKs for device installation: Completed"

Write-Output "Installing to device."
java -jar .\bundletool-all.jar  install-apks --apks=$AppApks
Write-Output "Installing to device: Completed."
