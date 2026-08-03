const themes = ['tomato', 'latte', 'mocha', 'macchiato', 'frappe'];
let currentTheme = localStorage.getItem('theme') || 'tomato';
document.documentElement.setAttribute('data-theme', currentTheme);

function toggleTheme() {
  let index = themes.indexOf(currentTheme);
  currentTheme = themes[(index + 1) % themes.length];
  
  document.documentElement.setAttribute('data-theme', currentTheme);
  localStorage.setItem('theme', currentTheme);
  
  const btn = document.getElementById('theme-toggle');
  if(btn) btn.innerText = 'Theme: ' + currentTheme.charAt(0).toUpperCase() + currentTheme.slice(1);
}

window.addEventListener('DOMContentLoaded', () => {
  const btn = document.getElementById('theme-toggle');
  if (btn) {
      btn.innerText = 'Theme: ' + currentTheme.charAt(0).toUpperCase() + currentTheme.slice(1);
      btn.onclick = toggleTheme;
  }
});
