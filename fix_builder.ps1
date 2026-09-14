$f = "c:\Users\Saad Ahmed\Desktop\new1\index.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
$start = $c.IndexOf("<!-- ===================== PROJECT BUILDER")
$end = $c.IndexOf("</section>", $start) + 10

$new = @"
    <!-- ===================== PROJECT BUILDER ===================== -->
    <section class="builder" id="solutions">
      <div class="container">
        <div class="builder-header reveal">
          <p class="section-kicker">OUR SIGNATURE PROCESS</p>
          <h2>Build Your Perfect Digital Solution</h2>
          <p class="builder-subtitle">Answer a few questions and get an instant price estimate right here.</p>
        </div>

        <div class="inline-wizard reveal delay-1">

          <div class="iw-stepper">
            <div class="iw-step active" id="iw-si-1"><div class="iw-circle" id="iw-sc-1">1</div><span>Website Type</span></div>
            <div class="iw-line" id="iw-sl-1"></div>
            <div class="iw-step" id="iw-si-2"><div class="iw-circle" id="iw-sc-2">2</div><span>Design</span></div>
            <div class="iw-line" id="iw-sl-2"></div>
            <div class="iw-step" id="iw-si-3"><div class="iw-circle" id="iw-sc-3">3</div><span>Style & Features</span></div>
            <div class="iw-line" id="iw-sl-3"></div>
            <div class="iw-step" id="iw-si-4"><div class="iw-circle" id="iw-sc-4">4</div><span>Summary</span></div>
          </div>

          <div class="iw-panel active" id="iw-panel-1">
            <p class="iw-label">Step 1 of 4</p>
            <h3 class="iw-title">What Type of Website Do You Need?</h3>
            <p class="iw-sub">Select the type that best fits your business goals.</p>
            <div class="iw-type-grid">
              <div class="iw-type-card" data-type="Business Website" data-base="299"><i data-lucide="building-2"></i><h6>Business Website</h6><p>Company / Corporate</p></div>
              <div class="iw-type-card" data-type="E-Commerce" data-base="499"><i data-lucide="shopping-cart"></i><h6>E-Commerce</h6><p>Online Store</p></div>
              <div class="iw-type-card" data-type="Portfolio" data-base="199"><i data-lucide="layout-grid"></i><h6>Portfolio</h6><p>Showcase Work</p></div>
              <div class="iw-type-card" data-type="Restaurant" data-base="349"><i data-lucide="utensils"></i><h6>Restaurant</h6><p>Food & Beverages</p></div>
              <div class="iw-type-card" data-type="Real Estate" data-base="449"><i data-lucide="home"></i><h6>Real Estate</h6><p>Property Listings</p></div>
              <div class="iw-type-card" data-type="Healthcare" data-base="399"><i data-lucide="heart-pulse"></i><h6>Healthcare</h6><p>Clinic / Hospital</p></div>
              <div class="iw-type-card" data-type="Education" data-base="349"><i data-lucide="graduation-cap"></i><h6>Education</h6><p>School / University</p></div>
              <div class="iw-type-card" data-type="Travel" data-base="399"><i data-lucide="plane"></i><h6>Travel</h6><p>Tours & Booking</p></div>
              <div class="iw-type-card" data-type="Construction" data-base="349"><i data-lucide="hammer"></i><h6>Construction</h6><p>Building & Roofing</p></div>
              <div class="iw-type-card" data-type="Agency" data-base="449"><i data-lucide="megaphone"></i><h6>Agency</h6><p>Marketing / Digital</p></div>
              <div class="iw-type-card" data-type="NGO/Charity" data-base="249"><i data-lucide="heart-handshake"></i><h6>NGO / Charity</h6><p>Non-Profit</p></div>
              <div class="iw-type-card" data-type="Custom" data-base="599"><i data-lucide="sliders"></i><h6>Custom</h6><p>Other / Specific</p></div>
            </div>
            <div class="iw-footer"><button class="btn btn-primary" onclick="iwNext(1)">Next Step <i data-lucide="arrow-right"></i></button></div>
          </div>

          <div class="iw-panel" id="iw-panel-2">
            <p class="iw-label">Step 2 of 4</p>
            <h3 class="iw-title">Choose a Design</h3>
            <p class="iw-sub">Pick a template or go fully custom.</p>
            <div class="iw-design-grid" id="iw-designGrid"></div>
            <div class="iw-custom-opt" id="iw-customOpt" onclick="iwSelectCustom()">
              <i data-lucide="pencil"></i>
              <div><strong>Custom Design</strong><span>We build from scratch - fully unique</span></div>
            </div>
            <div class="iw-footer">
              <button class="btn btn-outline" onclick="iwBack(2)"><i data-lucide="arrow-left"></i> Back</button>
              <button class="btn btn-primary" onclick="iwNext(2)">Next Step <i data-lucide="arrow-right"></i></button>
            </div>
          </div>

          <div class="iw-panel" id="iw-panel-3">
            <p class="iw-label">Step 3 of 4</p>
            <h3 class="iw-title">Style & Features</h3>
            <p class="iw-sub">Choose a style and features you need.</p>
            <p class="iw-section-label">Design Style</p>
            <div class="iw-style-grid">
              <div class="iw-style-card" data-style="Modern" data-price="0">Modern</div>
              <div class="iw-style-card" data-style="Luxury" data-price="100">Luxury</div>
              <div class="iw-style-card" data-style="Minimal" data-price="0">Minimal</div>
              <div class="iw-style-card" data-style="Corporate" data-price="50">Corporate</div>
              <div class="iw-style-card" data-style="Creative" data-price="80">Creative</div>
              <div class="iw-style-card" data-style="Dark Mode" data-price="60">Dark Mode</div>
              <div class="iw-style-card" data-style="Cozy" data-price="30">Cozy</div>
              <div class="iw-style-card" data-style="Techy" data-price="70">Techy</div>
            </div>
            <p class="iw-section-label" style="margin-top:24px">Features</p>
            <div class="iw-feat-grid">
              <div class="iw-feat" data-feature="Contact Form" data-price="0"><i data-lucide="mail"></i><span>Contact Form</span></div>
              <div class="iw-feat" data-feature="WhatsApp Chat" data-price="30"><i data-lucide="message-circle"></i><span>WhatsApp Chat</span></div>
              <div class="iw-feat" data-feature="Online Booking" data-price="80"><i data-lucide="calendar-check"></i><span>Online Booking</span></div>
              <div class="iw-feat" data-feature="Blog / News" data-price="60"><i data-lucide="newspaper"></i><span>Blog / News</span></div>
              <div class="iw-feat" data-feature="E-Commerce" data-price="150"><i data-lucide="shopping-bag"></i><span>E-Commerce</span></div>
              <div class="iw-feat" data-feature="SEO Optimization" data-price="100"><i data-lucide="trending-up"></i><span>SEO Setup</span></div>
              <div class="iw-feat" data-feature="Multi-Language" data-price="120"><i data-lucide="languages"></i><span>Multi-Language</span></div>
              <div class="iw-feat" data-feature="Payment Gateway" data-price="100"><i data-lucide="credit-card"></i><span>Payment Gateway</span></div>
              <div class="iw-feat" data-feature="Admin Dashboard" data-price="200"><i data-lucide="layout-dashboard"></i><span>Admin Dashboard</span></div>
              <div class="iw-feat" data-feature="Live Chat" data-price="50"><i data-lucide="message-square"></i><span>Live Chat</span></div>
              <div class="iw-feat" data-feature="Social Media" data-price="30"><i data-lucide="share-2"></i><span>Social Media</span></div>
              <div class="iw-feat" data-feature="Google Analytics" data-price="40"><i data-lucide="bar-chart-2"></i><span>Analytics</span></div>
            </div>
            <div class="iw-footer">
              <button class="btn btn-outline" onclick="iwBack(3)"><i data-lucide="arrow-left"></i> Back</button>
              <button class="btn btn-primary" onclick="iwNext(3)">See My Price <i data-lucide="arrow-right"></i></button>
            </div>
          </div>

          <div class="iw-panel" id="iw-panel-4">
            <p class="iw-label">Step 4 of 4</p>
            <h3 class="iw-title">Your Project Summary</h3>
            <p class="iw-sub">Review your selections and see your estimated investment.</p>
            <div class="iw-summary-grid">
              <div class="iw-summary-left">
                <div class="iw-sum-block">
                  <div class="iw-sum-row"><span>Website Type</span><strong id="iws-type">-</strong></div>
                  <div class="iw-sum-row"><span>Design</span><strong id="iws-design">-</strong></div>
                  <div class="iw-sum-row"><span>Style</span><strong id="iws-style">-</strong></div>
                  <div class="iw-sum-row"><span>Features</span><span id="iws-feats" style="text-align:right;font-size:0.82rem;color:var(--muted)">-</span></div>
                </div>
                <div class="iw-sum-block">
                  <div class="iw-sum-row"><span>Base Price</span><strong id="iws-base">-</strong></div>
                  <div class="iw-sum-row"><span>Design Add-on</span><strong id="iws-dp">-</strong></div>
                  <div class="iw-sum-row"><span>Style Add-on</span><strong id="iws-sp">-</strong></div>
                  <div class="iw-sum-row"><span>Features Total</span><strong id="iws-fp">-</strong></div>
                  <div class="iw-sum-row iw-sum-total"><span>Estimated Total</span><strong id="iws-total">-</strong></div>
                </div>
              </div>
              <div class="iw-price-box">
                <p class="iw-price-label">Estimated Investment</p>
                <div class="iw-currency-tabs">
                  <button class="iw-cur active" onclick="iwSetCur('usd',this)">USD</button>
                  <button class="iw-cur" onclick="iwSetCur('pkr',this)">PKR</button>
                  <button class="iw-cur" onclick="iwSetCur('cad',this)">CAD</button>
                </div>
                <div class="iw-price-main" id="iws-price-display">$ -</div>
                <div class="iw-price-note" id="iws-range"></div>
                <a href="contact.html" class="btn btn-white" style="width:100%;justify-content:center;margin-top:20px;">Request This Project <i data-lucide="arrow-right"></i></a>
              </div>
            </div>
            <div class="iw-footer">
              <button class="btn btn-outline" onclick="iwBack(4)"><i data-lucide="arrow-left"></i> Back</button>
              <button class="btn btn-primary" onclick="iwReset()">Start Over <i data-lucide="refresh-cw"></i></button>
            </div>
          </div>

        </div>
      </div>
    </section>
"@

$result = $c.Substring(0, $start) + $new + $c.Substring($end)
[System.IO.File]::WriteAllText($f, $result, [System.Text.Encoding]::UTF8)
Write-Host "Done"
