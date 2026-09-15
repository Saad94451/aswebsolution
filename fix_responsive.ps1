
$mobileHeroCSS = @"

    /* ── PAGE HERO MOBILE ── */
    @media (max-width: 767px) {
      .page-hero { padding: 120px 0 70px; }
      .page-hero h1 { font-size: clamp(1.8rem, 7vw, 2.8rem); }
      .page-hero .lead { font-size: 0.95rem; }
      .breadcrumb { font-size: 0.75rem; }
    }
"@

$files = @("about.html","whyus.html","catalog.html","contact.html")
foreach($file in $files) {
    $f = "c:\Users\Saad Ahmed\Desktop\new1\$file"
    $c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)

    # Add mobile hero CSS before closing </style>
    if ($c -notmatch "PAGE HERO MOBILE") {
        $c = $c -replace '</style>', ($mobileHeroCSS + "`n  </style>")
    }

    # Add mobile.css link if not present
    if ($c -notmatch 'mobile\.css') {
        $c = $c -replace '<link rel="stylesheet" href="style.css">', '<link rel="stylesheet" href="style.css">' + "`n  <link rel=`"stylesheet`" href=`"mobile.css`">"
    }

    [System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
    Write-Host "$file responsive updated"
}
