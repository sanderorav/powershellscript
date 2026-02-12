$hashtable1=@{Name="John","Joe","Mary"; DaysWorked=12,20,18}

$hashtable2=@{Name=$hashtable1.Name; SalaryPerDay=100,120,150}

$salary = for ($i = 0; $i -lt $hashtable1.DaysWorked.Count; $i++) {
    $hashtable1.DaysWorked[$i] * $hashtable2.SalaryPerDay[$i]
}

$hashtable3=@{Name=$hashtable1.Name; Salary=$salary}

$hashtable3
