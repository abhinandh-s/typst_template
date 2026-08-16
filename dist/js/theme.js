const themes = ['tomato', 'latte', 'mocha', 'macchiato', 'frappe'];
let currentTheme = localStorage.getItem('theme') || 'tomato';
document.documentElement.setAttribute('data-theme', currentTheme);

function toggleTheme() {
  let index = themes.indexOf(currentTheme);
  currentTheme = themes[(index + 1) % themes.length];

  document.documentElement.setAttribute('data-theme', currentTheme);
  localStorage.setItem('theme', currentTheme);
}

window.addEventListener('DOMContentLoaded', () => {
  const btn = document.getElementById('theme-toggle');
  if (btn) {
      btn.onclick = toggleTheme;
  }
});
