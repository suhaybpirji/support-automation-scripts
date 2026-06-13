# get-disk-usage.ps1
# Shows used and free space for all drives in GB

Get-PSDrive -PSProvider FileSystem |
Select-Object Name,
              @{Name="Used(GB)"; Expression = { "{0:N2}" -f ($_.Used / 1GB) }},
              @{Name="Free(GB)"; Expression = { "{0:N2}" -f ($_.Free / 1GB) }}
