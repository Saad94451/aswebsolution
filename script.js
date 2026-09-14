/* =========================================================
   AS Web Solution — Interactions
   ========================================================= */
(function () {
  "use strict";

  document.addEventListener("DOMContentLoaded", init);

  function init() {
    if (window.lucide) lucide.createIcons();
    setupMenu();
    setupStickyHeader();
    setupHeroVideos();
    setupSmoothScroll();
    setupActiveNav();
    setupStats();
    setupTestimonials();
    setupFaq();
    setupBackToTop();
    setupStoryModal();
    setupContactForm();
  }

  /* ---------- Mobile menu ---------- */
  function setupMenu() {
    const toggle = document.getElementById("menuToggle");
    const nav = document.getElementById("nav");
    if (!toggle || !nav) return;

    const close = () => {
      nav.classList.remove("open");
      toggle.classList.remove("open");
      toggle.setAttribute("aria-expanded", "false");
    };

    toggle.addEventListener("click", () => {
      const isOpen = nav.classList.toggle("open");
      toggle.classList.toggle("open", isOpen);
      toggle.setAttribute("aria-expanded", String(isOpen));
    });

    nav.querySelectorAll("a").forEach((link) => link.addEventListener("click", close));
    document.addEventListener("click", (e) => {
      if (!nav.contains(e.target) && !toggle.contains(e.target)) close();
    });
  }

  /* ---------- Sticky header ---------- */
  function setupStickyHeader() {
    const header = document.getElementById("header");
    if (!header) return;
    const onScroll = () => {
      header.classList.toggle("scrolled", window.scrollY > 80);
    };
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
  }

  /* ---------- Hero video ---------- */
  function setupHeroVideos() {
    // CSS animation handles it
  }

  /* ---------- Smooth scrolling ---------- */
  function setupSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
      anchor.addEventListener("click", (e) => {
        const id = anchor.getAttribute("href");
        if (!id || id === "#") return;
        const target = document.querySelector(id);
        if (!target) return;
        e.preventDefault();
        target.scrollIntoView({ behavior: "smooth", block: "start" });
      });
    });
  }

  /* ---------- Active nav ---------- */
  function setupActiveNav() {
    const links = [...document.querySelectorAll(".nav-link")];
    const map = links
      .map((link) => ({ link, el: document.querySelector(link.getAttribute("href")) }))
      .filter((item) => item.el);
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (!entry.isIntersecting) return;
          const match = map.find((item) => item.el === entry.target);
          if (!match) return;
          links.forEach((l) => l.classList.remove("active"));
          match.link.classList.add("active");
        });
      },
      { rootMargin: "-40% 0px -50% 0px", threshold: 0.1 }
    );
    map.forEach((item) => observer.observe(item.el));
  }

  /* ---------- Stats ---------- */
  function setupStats() {
    const stats = document.querySelectorAll(".stat-number");
    if (!stats.length) return;
    const animate = (el) => {
      const target = Number(el.dataset.count);
      const suffix = el.dataset.suffix || "";
      const start = performance.now();
      const duration = 1400;
      const tick = (now) => {
        const t = Math.min((now - start) / duration, 1);
        const eased = 1 - Math.pow(1 - t, 3);
        el.textContent = Math.round(target * eased) + suffix;
        if (t < 1) requestAnimationFrame(tick);
      };
      requestAnimationFrame(tick);
    };
    const observer = new IntersectionObserver(
      (entries, obs) => {
        entries.forEach((entry) => {
          if (!entry.isIntersecting) return;
          animate(entry.target);
          obs.unobserve(entry.target);
        });
      },
      { threshold: 0.4 }
    );
    stats.forEach((stat) => observer.observe(stat));
  }

  /* ---------- Testimonials ---------- */
  function setupTestimonials() {
    const track = document.getElementById("testimonialTrack");
    const dotsWrap = document.getElementById("testimonialDots");
    const prev = document.getElementById("prevTestimonial");
    const next = document.getElementById("nextTestimonial");
    if (!track) return;

    const cards = [...track.children];
    let index = 0;
    let timer;

    const perView = () => (window.innerWidth < 900 ? 1 : 3);
    const maxIndex = () => Math.max(0, cards.length - perView());

    function buildDots() {
      dotsWrap.innerHTML = "";
      const total = maxIndex() + 1;
      for (let i = 0; i < total; i++) {
        const dot = document.createElement("button");
        dot.type = "button";
        dot.setAttribute("aria-label", "Go to slide " + (i + 1));
        dot.addEventListener("click", () => { go(i); play(); });
        dotsWrap.appendChild(dot);
      }
    }

    function go(i) {
      index = Math.max(0, Math.min(i, maxIndex()));
      const gap = parseFloat(window.getComputedStyle(track).gap) || 18;
      const cardWidth = cards[0].getBoundingClientRect().width;
      track.style.transform = `translateX(-${index * (cardWidth + gap)}px)`;
      [...dotsWrap.children].forEach((dot, di) => {
        dot.classList.toggle("active", di === index);
      });
    }

    function play() {
      stop();
      timer = setInterval(() => go(index >= maxIndex() ? 0 : index + 1), 5000);
    }
    function stop() { clearInterval(timer); }

    prev.addEventListener("click", () => { go(index - 1); play(); });
    next.addEventListener("click", () => { go(index + 1); play(); });
    track.addEventListener("mouseenter", stop);
    track.addEventListener("mouseleave", play);

    window.addEventListener("resize", () => {
      buildDots();
      go(0);
    });

    buildDots();
    go(0);
    play();
  }

  /* ---------- FAQ ---------- */
  function setupFaq() {
    document.querySelectorAll(".faq-index-q, .faq-q").forEach((btn) => {
      btn.addEventListener("click", () => {
        const answer = btn.nextElementSibling;
        const isOpen = btn.classList.contains("open");
        btn.classList.toggle("open", !isOpen);
        if (answer) answer.classList.toggle("open", !isOpen);
      });
    });
  }

  /* ---------- Back to top ---------- */
  function setupBackToTop() {
    const btn = document.getElementById("toTop");
    if (!btn) return;
    window.addEventListener("scroll", () => {
      btn.classList.toggle("show", window.scrollY > 600);
    }, { passive: true });
    btn.addEventListener("click", () => window.scrollTo({ top: 0, behavior: "smooth" }));
  }

  /* ---------- Story modal ---------- */
  function setupStoryModal() {
    const modal = document.getElementById("storyModal");
    const close = document.getElementById("closeStory");
    if (!modal || !close) return;
    const hide = () => modal.setAttribute("hidden", "");
    const show = () => modal.removeAttribute("hidden");
    close.addEventListener("click", hide);
    modal.addEventListener("click", (e) => { if (e.target === modal) hide(); });
    document.addEventListener("keydown", (e) => { if (e.key === "Escape") hide(); });
  }

  /* ---------- Contact form ---------- */
  function setupContactForm() {
    const form = document.getElementById("project-form");
    if (!form) return;
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const data = Object.fromEntries(new FormData(form).entries());
      if (!data.name || !data.email || !data.message) return;
      form.reset();
    });
  }

})();


/* ===================== INLINE WIZARD ===================== */
(function () {

  var iw = {
    step: 1,
    type: null, typeBase: 0,
    design: null, designPrice: 0, designCustom: false,
    style: null, stylePrice: 0,
    features: [], featuresPrice: 0,
    currency: 'usd',
    totalUSD: 0
  };

  var RATES = { usd: 1, cad: 1.36, pkr: 278 };
  var SYMS  = { usd: 'USD $', cad: 'CAD $', pkr: 'PKR Rs' };

  var ALL_DESIGNS = [
    "WhatsApp%20Image%202026-09-08%20at%2011.39.55%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.39.57%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.39.58%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.39.59%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.00%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.01%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.02%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.04%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.05%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.07%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.08%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.10%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.15%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.16%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.18%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.19%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.19%20PM%20(1).jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.21%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.22%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.23%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.25%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.26%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.27%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.28%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.29%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.31%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.37%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.38%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.40%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.41%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.43%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.44%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.45%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.50%20PM%20(2).jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.51%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.40.55%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.41.02%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.41.04%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.41.10%20PM.jpeg",
    "WhatsApp%20Image%202026-09-08%20at%2011.41.11%20PM.jpeg"
  ];

  /* ── Global functions called from onclick in HTML ── */
  window.iwSelectType = function(el) {
    document.querySelectorAll('.iw-type-card').forEach(function(c){ c.classList.remove('selected'); });
    el.classList.add('selected');
    iw.type = el.dataset.type;
    iw.typeBase = parseInt(el.dataset.base);
  };

  window.iwSelectStyle = function(el) {
    document.querySelectorAll('.iw-style-card').forEach(function(c){ c.classList.remove('selected'); });
    el.classList.add('selected');
    iw.style = el.dataset.style;
    iw.stylePrice = parseInt(el.dataset.price);
    iw.design = el.dataset.style;
    iw.designCustom = false;
    iw.designPrice = 0;
    // deselect custom
    var co = document.getElementById('iw-customOpt');
    if (co) co.classList.remove('selected');
  };

  window.iwToggleFeat = function(el) {
    el.classList.toggle('selected');
    var feat  = el.dataset.feature;
    var price = parseInt(el.dataset.price);
    if (el.classList.contains('selected')) {
      iw.features.push(feat);
      iw.featuresPrice += price;
    } else {
      iw.features = iw.features.filter(function(f){ return f !== feat; });
      iw.featuresPrice -= price;
    }
  };

  window.iwSelectCustom = function() {
    document.querySelectorAll('.iw-style-card').forEach(function(c){ c.classList.remove('selected'); });
    var co = document.getElementById('iw-customOpt');
    if (co) co.classList.toggle('selected');
    iw.style = null;
    iw.stylePrice = 0;
    iw.design = co && co.classList.contains('selected') ? 'Custom Design' : null;
    iw.designPrice = co && co.classList.contains('selected') ? 200 : 0;
    iw.designCustom = co && co.classList.contains('selected');
  };

  window.iwSetCur = function(cur, btn) {
    iw.currency = cur;
    document.querySelectorAll('.iw-cur').forEach(function(b){ b.classList.remove('active'); });
    btn.classList.add('active');
    iwUpdatePrice();
  };

  window.iwNext = function(from) {
    if (from === 1) {
      if (!iw.type) { alert('Please select a website type.'); return; }
    }
    if (from === 2) {
      if (!iw.style && !iw.designCustom) { alert('Please select a design style or choose Custom.'); return; }
    }
    if (from === 3) {
      buildSummary();
    }
    iwGoTo(from + 1);
  };

  window.iwBack = function(from) {
    iwGoTo(from - 1);
  };

  window.iwReset = function() {
    iw.step = 1; iw.type = null; iw.typeBase = 0;
    iw.design = null; iw.designPrice = 0; iw.designCustom = false;
    iw.style = null; iw.stylePrice = 0;
    iw.features = []; iw.featuresPrice = 0;
    iw.currency = 'usd'; iw.totalUSD = 0;
    document.querySelectorAll('.iw-type-card, .iw-design-card, .iw-style-card, .iw-feat').forEach(function(c){ c.classList.remove('selected'); });
    var co = document.getElementById('iw-customOpt');
    if (co) co.classList.remove('selected');
    iwGoTo(1);
  };

  /* ── Internal functions ── */
  function buildDesignGrid() {
    var grid = document.getElementById('iw-designGrid');
    if (!grid || grid.children.length > 0) return;
    ALL_DESIGNS.forEach(function(img, i) {
      var card = document.createElement('div');
      card.className = 'iw-design-card';
      card.innerHTML =
        '<img src="assets/img/new/' + img + '" alt="Template ' + (i+1) + '" loading="lazy">' +
        '<div class="iw-design-card-body"><h6>Template ' + (i+1) + '</h6></div>' +
        '<div class="iw-check-badge">&#10003;</div>';
      card.addEventListener('click', function() {
        document.querySelectorAll('.iw-design-card').forEach(function(c){ c.classList.remove('selected'); });
        var co = document.getElementById('iw-customOpt');
        if (co) co.classList.remove('selected');
        card.classList.add('selected');
        iw.design = 'Template ' + (i+1);
        iw.designPrice = 0;
        iw.designCustom = false;
      });
      grid.appendChild(card);
    });
  }

  function buildSummary() {
    iw.totalUSD = iw.typeBase + iw.designPrice + iw.stylePrice + iw.featuresPrice;
    setText('iws-type',   iw.type || '-');
    setText('iws-design', iw.design || '-');
    setText('iws-style',  iw.style || '-');
    setText('iws-feats',  iw.features.length ? iw.features.join(', ') : 'None');
    setText('iws-base',   '$' + iw.typeBase);
    setText('iws-dp',     iw.designCustom ? '+$200 (Custom)' : (iw.designPrice > 0 ? '+$' + iw.designPrice : 'Included'));
    setText('iws-sp',     iw.stylePrice > 0 ? '+$' + iw.stylePrice : 'Included');
    setText('iws-fp',     '+$' + iw.featuresPrice);
    setText('iws-total',  'USD $' + iw.totalUSD);
    iwUpdatePrice();
  }

  function setText(id, val) {
    var el = document.getElementById(id);
    if (el) el.textContent = val;
  }

  function iwUpdatePrice() {
    var t    = iw.totalUSD;
    var rate = RATES[iw.currency];
    var sym  = SYMS[iw.currency];
    var conv = Math.round(t * rate);
    var lo   = Math.round(conv * 0.9);
    var hi   = Math.round(conv * 1.15);
    setText('iws-price-display', sym + ' ' + conv.toLocaleString());
    setText('iws-range', 'Range: ' + sym + ' ' + lo.toLocaleString() + ' - ' + hi.toLocaleString());
  }

  function iwGoTo(n) {
    document.querySelectorAll('.iw-panel').forEach(function(p){ p.classList.remove('active'); });
    var panel = document.getElementById('iw-panel-' + n);
    if (panel) panel.classList.add('active');
    iw.step = n;
    iwUpdateStepper(n);
    if (window.lucide) lucide.createIcons();
    var wiz = document.querySelector('.inline-wizard');
    if (wiz) wiz.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }

  function iwUpdateStepper(n) {
    for (var i = 1; i <= 4; i++) {
      var si = document.getElementById('iw-si-' + i);
      var sc = document.getElementById('iw-sc-' + i);
      if (!si || !sc) continue;
      si.classList.remove('active', 'done');
      if (i < n)      { si.classList.add('done');   sc.textContent = '✓'; }
      else if (i === n){ si.classList.add('active'); sc.textContent = i; }
      else             { sc.textContent = i; }
      if (i < 4) {
        var sl = document.getElementById('iw-sl-' + i);
        if (sl) sl.classList.toggle('done', i < n);
      }
    }
  }

})();
