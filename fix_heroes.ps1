
# ── about.html hero ──
$f = "c:\Users\Saad Ahmed\Desktop\new1\about.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
$old = '.page-hero {
      padding: 100px 0 70px;
      background: radial-gradient(900px 420px at 80% 20%, rgba(37,99,235,.12), transparent 60%),
                  linear-gradient(#fff, #F7FAFF);
      text-align: center;
    }'
$new = '.page-hero {
      position: relative;
      padding: 160px 0 100px;
      background: url("https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=1600&h=800&fit=crop") center/cover no-repeat;
      text-align: center;
      overflow: hidden;
    }
    .page-hero::before {
      content: "";
      position: absolute;
      inset: 0;
      background: linear-gradient(135deg, rgba(6,42,92,.78) 0%, rgba(3,27,61,.65) 100%);
      z-index: 0;
    }
    .page-hero .container { position: relative; z-index: 1; }
    .page-hero h1 { color: #fff; }
    .page-hero .lead { color: rgba(255,255,255,.85); }
    .page-hero .eyebrow { color: #93C5FD; }
    .page-hero .breadcrumb a { color: #93C5FD; }
    .page-hero .breadcrumb span { color: rgba(255,255,255,.6); }'
$c = $c.Replace($old, $new)
[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "about.html done"

# ── whyus.html hero ──
$f = "c:\Users\Saad Ahmed\Desktop\new1\whyus.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
$old = '.page-hero {
      padding: 100px 0 70px;
      background: radial-gradient(900px 420px at 80% 20%, rgba(37,99,235,.12), transparent 60%),
                  linear-gradient(#fff, #F7FAFF);
      text-align: center;
    }'
$new = '.page-hero {
      position: relative;
      padding: 160px 0 100px;
      background: url("https://images.unsplash.com/photo-1552664730-d307ca884978?w=1600&h=800&fit=crop") center/cover no-repeat;
      text-align: center;
      overflow: hidden;
    }
    .page-hero::before {
      content: "";
      position: absolute;
      inset: 0;
      background: linear-gradient(135deg, rgba(6,42,92,.78) 0%, rgba(3,27,61,.65) 100%);
      z-index: 0;
    }
    .page-hero .container { position: relative; z-index: 1; }
    .page-hero h1 { color: #fff; }
    .page-hero .lead { color: rgba(255,255,255,.85); }
    .page-hero .eyebrow { color: #93C5FD; }
    .page-hero .breadcrumb a { color: #93C5FD; }
    .page-hero .breadcrumb span { color: rgba(255,255,255,.6); }'
$c = $c.Replace($old, $new)
[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "whyus.html done"

# ── catalog.html hero ──
$f = "c:\Users\Saad Ahmed\Desktop\new1\catalog.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
$old = '.page-hero {
      padding: 100px 0 70px;
      background: radial-gradient(900px 420px at 80% 20%, rgba(37,99,235,.12), transparent 60%),
                  linear-gradient(#fff, #F7FAFF);
      text-align: center;
    }'
$new = '.page-hero {
      position: relative;
      padding: 160px 0 100px;
      background: url("https://images.unsplash.com/photo-1547658719-da2b51169166?w=1600&h=800&fit=crop") center/cover no-repeat;
      text-align: center;
      overflow: hidden;
    }
    .page-hero::before {
      content: "";
      position: absolute;
      inset: 0;
      background: linear-gradient(135deg, rgba(6,42,92,.78) 0%, rgba(3,27,61,.65) 100%);
      z-index: 0;
    }
    .page-hero .container { position: relative; z-index: 1; }
    .page-hero h1 { color: #fff; }
    .page-hero .lead { color: rgba(255,255,255,.85); }
    .page-hero .eyebrow { color: #93C5FD; }
    .page-hero .breadcrumb a { color: #93C5FD; }
    .page-hero .breadcrumb span { color: rgba(255,255,255,.6); }'
$c = $c.Replace($old, $new)
[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "catalog.html done"

# ── contact.html hero ──
$f = "c:\Users\Saad Ahmed\Desktop\new1\contact.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
$old = '.page-hero {
      padding: 100px 0 70px;
      background: radial-gradient(900px 420px at 80% 20%, rgba(37,99,235,.12), transparent 60%),
                  linear-gradient(#fff, #F7FAFF);
      text-align: center;
    }'
$new = '.page-hero {
      position: relative;
      padding: 160px 0 100px;
      background: url("https://images.unsplash.com/photo-1423666639041-f56000c27a9a?w=1600&h=800&fit=crop") center/cover no-repeat;
      text-align: center;
      overflow: hidden;
    }
    .page-hero::before {
      content: "";
      position: absolute;
      inset: 0;
      background: linear-gradient(135deg, rgba(6,42,92,.78) 0%, rgba(3,27,61,.65) 100%);
      z-index: 0;
    }
    .page-hero .container { position: relative; z-index: 1; }
    .page-hero h1 { color: #fff; }
    .page-hero .lead { color: rgba(255,255,255,.85); }
    .page-hero .eyebrow { color: #93C5FD; }
    .page-hero .breadcrumb a { color: #93C5FD; }
    .page-hero .breadcrumb span { color: rgba(255,255,255,.6); }'
$c = $c.Replace($old, $new)
[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "contact.html done"
