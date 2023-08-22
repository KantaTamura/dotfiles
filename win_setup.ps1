$configs = Get-ChildItem "./config" -File

foreach ($config in $configs) {
    Copy-Item $config.FullName -Destination "$env:USERPROFILE\.config\$($config.Name)"
}