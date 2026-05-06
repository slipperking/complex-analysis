(function () {
  "use strict";

  // =========================================================================
  // 1. Theme toggle (light → dark → auto → light)
  // =========================================================================

  var THEMES = ["light", "dark", "auto"];
  var THEME_ICON_LIGHT = '<svg viewBox="0 0 512 512" width="18" height="18" aria-hidden="true" fill="currentColor"><path d="M361.5 1.2c5 2.1 8.6 6.6 9.6 11.9L391 121l107.9 19.8c5.3 1 9.8 4.6 11.9 9.6s1.5 10.7-1.6 15.2L446.9 256l62.3 90.3c3.1 4.5 3.7 10.2 1.6 15.2s-6.6 8.6-11.9 9.6L391 391 371.1 498.9c-1 5.3-4.6 9.8-9.6 11.9s-10.7 1.5-15.2-1.6L256 446.9l-90.3 62.3c-4.5 3.1-10.2 3.7-15.2 1.6s-8.6-6.6-9.6-11.9L121 391 13.1 371.1c-5.3-1-9.8-4.6-11.9-9.6s-1.5-10.7 1.6-15.2L65.1 256 2.8 165.7c-3.1-4.5-3.7-10.2-1.6-15.2s6.6-8.6 11.9-9.6L121 121 140.9 13.1c1-5.3 4.6-9.8 9.6-11.9s10.7-1.5 15.2 1.6L256 65.1 346.3 2.8c4.5-3.1 10.2-3.7 15.2-1.6zM160 256a96 96 0 1 1 192 0 96 96 0 1 1 -192 0zm224 0a128 128 0 1 0 -256 0 128 128 0 1 0 256 0z"></path></svg>';
  var THEME_ICON_DARK = '<svg viewBox="0 0 384 512" width="18" height="18" aria-hidden="true" fill="currentColor"><path d="M223.5 32C100 32 0 132.3 0 256S100 480 223.5 480c60.6 0 115.5-24.2 155.8-63.4c5-4.9 6.3-12.5 3.1-18.7s-10.1-9.7-17-8.5c-9.8 1.7-19.8 2.6-30.1 2.6c-96.9 0-175.5-78.8-175.5-176c0-65.8 36-123.1 89.3-153.3c6.1-3.5 9.2-10.5 7.7-17.3s-7.3-11.9-14.3-12.5c-6.3-.5-12.6-.8-19-.8z"></path></svg>';
  var THEME_ICON_AUTO = '<svg viewBox="0 0 512 512" width="18" height="18" aria-hidden="true" fill="currentColor"><path d="M448 256c0-106-86-192-192-192V448c106 0 192-86 192-192zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256z"></path></svg>';
  var THEME_ICONS = {
    light: THEME_ICON_LIGHT,
    dark: THEME_ICON_DARK,
    auto: THEME_ICON_AUTO,
  };

  var themeBtn = document.querySelector(".theme-toggle");
  var storedMode = localStorage.getItem("theme") || "auto";

  function resolveTheme(mode) {
    if (mode === "auto") {
      return matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
    }
    return mode;
  }

  function applyTheme(mode) {
    storedMode = mode;
    localStorage.setItem("theme", mode);
    document.documentElement.dataset.theme = resolveTheme(mode);
    if (themeBtn) {
      themeBtn.innerHTML = THEME_ICONS[mode] || THEME_ICONS.auto;
      themeBtn.title =
        mode === "light" ? "Theme: Light" :
        mode === "dark"  ? "Theme: Dark" :
                           "Theme: Auto";
      themeBtn.setAttribute("aria-label", themeBtn.title);
    }
  }

  if (themeBtn) {
    themeBtn.addEventListener("click", function () {
      var idx = (THEMES.indexOf(storedMode) + 1) % THEMES.length;
      applyTheme(THEMES[idx]);
    });
  }

  // Listen for OS theme changes when in auto mode
  matchMedia("(prefers-color-scheme: dark)").addEventListener("change", function () {
    if (storedMode === "auto") {
      document.documentElement.dataset.theme = resolveTheme("auto");
    }
  });

  // Apply on load (complements the inline FOUC-prevention script in <head>)
  applyTheme(storedMode);

  // =========================================================================
  // 2. Sidebar toggles (mobile)
  // =========================================================================

  var sidebarLeft = document.querySelector(".sidebar-left");
  var sidebarRight = document.querySelector(".sidebar-right");
  var backdrop = document.getElementById("sidebar-backdrop");
  var toggleLeft = document.getElementById("sidebar-toggle-left");
  var toggleRight = document.getElementById("sidebar-toggle-right");

  function closeSidebars() {
    if (sidebarLeft) sidebarLeft.classList.remove("open");
    if (sidebarRight) sidebarRight.classList.remove("open");
    if (backdrop) backdrop.classList.remove("visible");
  }

  if (toggleLeft && sidebarLeft) {
    toggleLeft.addEventListener("click", function () {
      var opening = !sidebarLeft.classList.contains("open");
      closeSidebars();
      if (opening) {
        sidebarLeft.classList.add("open");
        backdrop.classList.add("visible");
      }
    });
  }

  if (toggleRight && sidebarRight) {
    toggleRight.addEventListener("click", function () {
      var opening = !sidebarRight.classList.contains("open");
      closeSidebars();
      if (opening) {
        sidebarRight.classList.add("open");
        backdrop.classList.add("visible");
      }
    });
  }

  if (backdrop) {
    backdrop.addEventListener("click", closeSidebars);
  }

  // Auto-close sidebars when resizing above breakpoint
  window.addEventListener("resize", function () {
    if (window.innerWidth > 960 && sidebarLeft && sidebarLeft.classList.contains("open")) {
      closeSidebars();
    }
    if (window.innerWidth > 1200 && sidebarRight && sidebarRight.classList.contains("open")) {
      closeSidebars();
    }
  });

  // =========================================================================
  // 3. Search modal (Pagefind lazy-load)
  // =========================================================================

  var searchOverlay = document.getElementById("search-overlay");
  var searchInput = document.getElementById("search-input");
  var searchResults = document.getElementById("search-results");
  var searchTrigger = document.querySelector(".search-trigger");
  var pagefind = null;
  var searchTimeout = null;

  function openSearch() {
    if (!searchOverlay) return;
    searchOverlay.classList.add("visible");
    if (searchInput) {
      searchInput.value = "";
      searchInput.focus();
    }
    if (searchResults) searchResults.innerHTML = "";
    loadPagefind();
  }

  function closeSearch() {
    if (searchOverlay) searchOverlay.classList.remove("visible");
  }

  async function loadPagefind() {
    if (pagefind) return;
    try {
      // Dynamic import resolves relative to this module's URL (assets/nav.js)
      // so ./pagefind/pagefind.js -> assets/pagefind/pagefind.js
      pagefind = await import("./pagefind/pagefind.js");
      var baseMeta = document.querySelector('meta[name="pagefind-base"]');
      var baseUrl = baseMeta ? baseMeta.getAttribute("content") : "/";
      await pagefind.options({ baseUrl: baseUrl });
      await pagefind.init();
    } catch (e) {
      console.warn("Pagefind not available:", e);
    }
  }

  function performSearch(query) {
    if (!searchResults) return;
    if (!query || query.length < 2) {
      searchResults.innerHTML = "";
      return;
    }
    if (!pagefind) {
      searchResults.innerHTML = '<div class="search-no-results">Search index not available.</div>';
      return;
    }

    pagefind.search(query).then(function (results) {
      if (!results || !results.results || results.results.length === 0) {
        searchResults.innerHTML = '<div class="search-no-results">No results found.</div>';
        return;
      }
      // Load first 8 page results, then expand sub_results for section-level precision
      var items = results.results.slice(0, 8);
      Promise.all(items.map(function (r) { return r.data(); })).then(function (dataList) {
        var html = "";
        var count = 0;
        for (var i = 0; i < dataList.length && count < 12; i++) {
          var data = dataList[i];
          var pageTitle = (data.meta && data.meta.title) || "Untitled";
          // Use sub_results for section-level anchors (h2/h3 with IDs)
          var subs = data.sub_results;
          if (subs && subs.length > 0) {
            for (var j = 0; j < subs.length && count < 12; j++) {
              var sub = subs[j];
              var url = sub.url || data.url || "#";
              var title = sub.title || pageTitle;
              var excerpt = sub.excerpt || "";
              // Show page title as breadcrumb if sub-title differs
              var breadcrumb = (title !== pageTitle)
                ? '<div class="search-result-page">' + escapeHtml(pageTitle) + '</div>'
                : '';
              html += '<a class="search-result" href="' + url + '">'
                + breadcrumb
                + '<div class="search-result-title">' + escapeHtml(title) + '</div>'
                + '<div class="search-result-excerpt">' + excerpt + '</div>'
                + '</a>';
              count++;
            }
          } else {
            // Fallback: page-level result
            var url = data.url || "#";
            var excerpt = data.excerpt || "";
            html += '<a class="search-result" href="' + url + '">'
              + '<div class="search-result-title">' + escapeHtml(pageTitle) + '</div>'
              + '<div class="search-result-excerpt">' + excerpt + '</div>'
              + '</a>';
            count++;
          }
        }
        searchResults.innerHTML = html;
      });
    }).catch(function () {
      searchResults.innerHTML = '<div class="search-no-results">Search error.</div>';
    });
  }

  function escapeHtml(s) {
    var div = document.createElement("div");
    div.textContent = s;
    return div.innerHTML;
  }

  if (searchTrigger) {
    searchTrigger.addEventListener("click", openSearch);
  }

  if (searchInput) {
    searchInput.addEventListener("input", function () {
      clearTimeout(searchTimeout);
      searchTimeout = setTimeout(function () {
        performSearch(searchInput.value.trim());
      }, 200);
    });
  }

  // Click on overlay backdrop closes search
  if (searchOverlay) {
    searchOverlay.addEventListener("click", function (e) {
      if (e.target === searchOverlay) closeSearch();
    });
  }

  // =========================================================================
  // 4. Keyboard shortcuts
  // =========================================================================

  document.addEventListener("keydown", function (e) {
    // Ctrl+K or Cmd+K → open/close search
    if ((e.ctrlKey || e.metaKey) && e.key === "k") {
      e.preventDefault();
      if (searchOverlay && searchOverlay.classList.contains("visible")) {
        closeSearch();
      } else {
        openSearch();
      }
    }
    // Escape → close search or sidebar
    if (e.key === "Escape") {
      if (searchOverlay && searchOverlay.classList.contains("visible")) {
        closeSearch();
      } else {
        closeSidebars();
      }
    }
  });

  // =========================================================================
  // 5. Scroll-spy for local TOC
  // =========================================================================

  var tocLinks = document.querySelectorAll(".local-toc a");
  if (tocLinks.length > 0) {
    var topbar = document.querySelector(".topbar");
    var offset = (topbar ? topbar.offsetHeight : 56) + 16;
    var headingEls = [];
    var headingMap = {};

    tocLinks.forEach(function (link) {
      var id = link.getAttribute("href");
      if (id && id.startsWith("#")) {
        var el = document.getElementById(id.slice(1));
        if (el) {
          headingEls.push(el);
          headingMap[el.id] = link;
        }
      }
    });

    var ticking = false;
    function updateSpy() {
      ticking = false;
      var current = null;
      for (var i = 0; i < headingEls.length; i++) {
        if (headingEls[i].getBoundingClientRect().top <= offset) {
          current = headingEls[i];
        }
      }
      tocLinks.forEach(function (l) { l.classList.remove("active"); });
      if (current && headingMap[current.id]) {
        headingMap[current.id].classList.add("active");
      }
    }

    window.addEventListener("scroll", function () {
      if (!ticking) {
        requestAnimationFrame(updateSpy);
        ticking = true;
      }
    });

    // Initial highlight
    updateSpy();
  }

})();
