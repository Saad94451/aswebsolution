
$f = "c:\Users\Saad Ahmed\Desktop\new1\index.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)

# Add onclick to each iw-type-card
$c = $c -replace '<div class="iw-type-card" data-type="([^"]+)" data-base="([^"]+)">', '<div class="iw-type-card" data-type="$1" data-base="$2" onclick="iwSelectType(this)">'

# Add onclick to each iw-style-card
$c = $c -replace '<div class="iw-style-card" data-style="([^"]+)" data-price="([^"]+)">', '<div class="iw-style-card" data-style="$1" data-price="$2" onclick="iwSelectStyle(this)">'

# Add onclick to each iw-feat
$c = $c -replace '<div class="iw-feat" data-feature="([^"]+)" data-price="([^"]+)">', '<div class="iw-feat" data-feature="$1" data-price="$2" onclick="iwToggleFeat(this)">'

[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "Done"
