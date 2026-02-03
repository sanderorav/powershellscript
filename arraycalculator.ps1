$array1 = @(1,2,3)
$array2 = @(4,5,6)

$array3 = for ($i = 0; $i -lt $array1.Count; $i++) {
    $array1[$i] + $array2[$i]
}

$array3
