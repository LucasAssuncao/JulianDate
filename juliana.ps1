param(
    [string]$a
)

function normalToJulianDate($dayDifference){
    $julianDate = (Get-Date).AddDays($dayDifference)
    Write-Host $julianDate.DayOfYear
}

function JulianDateToNormal($dayDifference){
    $julianDate = (Get-Date -Day 1 -Month 1 -Year 2018).AddDays($dayDifference)
    Write-Host $julianDate.Date.ToString('dd-MM-yyyy')
}

Switch($a){
    'nj' {
        $today  = (Get-Date).ToString("dd-MM-yyyy")

        $date = Read-Host 'Please, enter the date in format (dd-mm-YYYY): '

        if ($date -eq 'today'){
            $ts = New-TimeSpan -Start $today -End $today

        }elseif ($date.Split('-')[2] -ne 2018){
            Write-Host 'The year must be' $today.Split('-')[2]
            exit

        }else{
            $ts = New-TimeSpan -Start $today -End $date

        }

        Write-Host 'Julian Date for the day'$date ':'
        normalToJulianDate $ts.Days
    }
    
    'jn' {
        $date = Read-Host 'Please, enter the julian date: '
        [int]$date = [int]$date-1
        JulianDateToNormal $date
    }
    
    default{
        Write-Host 'You shall not pass. Hahaha' -ForegroundColor Red
        Write-Host 'You must pass a parameter' -ForegroundColor Red
    }

}