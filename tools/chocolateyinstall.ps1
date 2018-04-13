$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation   = Join-Path $toolsDir 'psqlodbc_x86_09_06_0500.msi'
$fileLocation64 = Join-Path $toolsDir 'psqlodbc_x64_09_06_0500.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  file           = $fileLocation
  file64         = $fileLocation64

  softwareName   = 'psqlodbc*'

  checksum       = 'EE367F730F59076C6E64BF70EBD350F5C51F0ED4B1E402F2EB592376B51F4582'
  checksumType   = 'sha256'
  checksum64     = '87ABB9BF48246104AEDF5D33DEC7FFA4907C7B2CA4AC579DA83E5BC3406A8593'
  checksumType64 = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs










    









