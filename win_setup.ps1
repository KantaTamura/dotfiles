$home_dir = Get-ChildItem "." -File
$configs = Get-ChildItem "./config" -File

foreach ($home_conf in $home_dir) {
    Copy-Item $home_conf.FullName -Destination "$env:USERPROFILE\$($home_conf.Name)"
}

foreach ($config in $configs) {
    Copy-Item $config.FullName -Destination "$env:USERPROFILE\.config\$($config.Name)"
}