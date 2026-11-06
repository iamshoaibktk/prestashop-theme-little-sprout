/**
 * Little Sprout: sizes read "4–5 y (104–110 cm)". Wherever they are shown as buttons (product page,
 * card quick add, the age ruler on category pages) the age and the height go on two lines.
 * The age ruler shows only when the category's quick filter holds ages.
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 */
(function () {
  var AGE = /^(.+?)\s*\((\d[^)]*cm)\)\s*$/;
  var TARGETS = '.hbk-chip, .product-variant .btn-check + .btn > span, .hbk-qa__opt';

  function split(el) {
    if (el.querySelector('.ls-age')) return true;
    // Text for screen readers ("Age and height - ") stays as it is.
    var hidden = el.querySelector('.visually-hidden');
    var text = el.textContent.replace(hidden ? hidden.textContent : '', '').trim();
    var m = AGE.exec(text);
    if (!m) return false;
    if (!hidden && el.tagName === 'BUTTON') el.setAttribute('aria-label', text);
    el.textContent = '';
    if (hidden) el.appendChild(hidden);
    var a = document.createElement('span'); a.className = 'ls-age'; a.textContent = m[1];
    var h = document.createElement('span'); h.className = 'ls-height'; h.textContent = m[2];
    el.appendChild(a); el.appendChild(h);
    el.classList.add('ls-sized');
    return true;
  }

  function agebar() {
    var bar = document.querySelector('.js-ls-agebar');
    if (!bar) return;
    var chips = bar.querySelectorAll('.hbk-chip');
    var ages = 0;
    chips.forEach(function (c) { if (split(c)) ages++; });
    bar.hidden = ages === 0;
    var box = bar.querySelector('.js-hbk-chips');
    var title = bar.querySelector('.js-ls-agebar-title');
    if (title && box) title.textContent = box.getAttribute('aria-label') || '';
    bar.style.setProperty('--ls-stops', String(Math.max(chips.length, 1)));
  }

  var queued = false;
  function run() {
    queued = false;
    document.querySelectorAll(TARGETS).forEach(split);
    agebar();
  }
  function queue() { if (!queued) { queued = true; window.requestAnimationFrame(run); } }

  function init() {
    run();
    new MutationObserver(queue).observe(document.body, { childList: true, subtree: true });
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
