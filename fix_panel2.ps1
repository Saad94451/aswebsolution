$f = "c:\Users\Saad Ahmed\Desktop\new1\index.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)

# Find the broken old panel-2 (the one with "Choose a Design" and no closing div properly)
$oldPanel = '<div class="iw-panel" id="iw-panel-2">' + "`r`n" + '            <p class="iw-label">Step 2 of 4</p>' + "`r`n" + '            <h3 class="iw-title">Choose a Design</h3>' + "`r`n" + '            <p class="iw-sub">Pick a template or go fully custom.</p>'

$c = $c.Replace($oldPanel, "")

[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "Done"
