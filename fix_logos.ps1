
$files = @("about.html","whyus.html","catalog.html","contact.html")
$oldLogo = '<span class="logo-mark" aria-hidden="true">AS</span>'
$oldLogo2 = '<span class="logo-mark">AS</span>'
$newLogo = '<img src="./assets/img/logo-removebg.png" alt="AS Logo" style="height:52px;width:52px;">'
$newFooterLogo = '<img src="./assets/img/logo-removebg.png" alt="AS Logo" style="height:52px;width:52px;filter:brightness(0) invert(1);">'

foreach($file in $files) {
    $f = "c:\Users\Saad Ahmed\Desktop\new1\$file"
    $c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)

    # navbar logo
    $c = $c.Replace($oldLogo, $newLogo)
    $c = $c.Replace($oldLogo2, $newLogo)

    # footer logo (inside .logo.light)
    $oldFooter = '<a href="index.html" class="logo light">
            <span class="logo-mark">AS</span>'
    $newFooter = '<a href="index.html" class="logo light">
            ' + $newFooterLogo
    $c = $c.Replace($oldFooter, $newFooter)

    [System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
    Write-Host "$file logos updated"
}
