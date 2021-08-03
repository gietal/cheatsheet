# run this from the year folder

param(
    [Parameter(Mandatory=$true)]
    $year
)

function MoveFiles {
    param(
        $year,
        $month,
        $dest
    )

    if ((Test-Path $dest) -eq $false) {
        mkdir $dest > $null
    }

    Get-ChildItem -File | Where-Object {$_.lastwritetime.month -eq $month -and $_.lastwritetime.year -eq $year} | ForEach-Object {
        $num=1
        $nextName = Join-Path -Path $dest -ChildPath $_.name # start from base name i.e: 100.jpg
        $doMove = $true
        while(Test-Path -Path $nextName) {

            # a copy exist, check if it matches
            if((Get-FileHash $_.name).hash -eq (Get-FileHash $nextName).hash) {
                Write-Output "not moving '$_' because a matching file already exist at '$nextName'"
                $doMove = $false
                break
            } else {
                Write-Verbose "$nextName exist, but the hash is different than $_. so we should move this"
                # fallthrough to create new filename until either:
                #   the file with the same hash is found ( in which case we dont move it)
                #   a unique name is found without finding any file with the same hash. then we move
            }

            # create new name starting with 100_1.jpg, then 100_2.jpg, etc..
            $nextName = Join-Path $dest ($_.BaseName + "_$num" + $_.Extension)    
            $num+=1
        }

        if ($doMove) {
            $_ | Move-Item -Destination $nextName
        } else {
            Write-Verbose "not moving $_.name because it already exist"
        }
    }

}


$months = @(
    "0100 jan",
    "0200 feb",
    "0300 mar",
    "0400 apr",
    "0500 may",
    "0600 jun",
    "0700 jul",
    "0800 aug",
    "0900 sep",
    "1000 oct",
    "1100 nov",
    "1200 dec"
    )

$months | ForEach-Object {$i = 1} {
    $dest = $_
    $month = $i

    Write-Output "Moving files for year: $year, month: $month, to folder: $dest"
    MoveFiles -year $year -month $month -dest $dest

    $i += 1
} 



