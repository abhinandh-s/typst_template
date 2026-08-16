document.addEventListener("DOMContentLoaded", () => {
  const toggleBtn = document.getElementById("sidebar-toggle");
  const sidebar = document.getElementById("sidebar");

  toggleBtn.addEventListener("click", () => {
    document.body.classList.toggle("sidebar-toggled");
  });

  sidebar.addEventListener("click", (event) => {
    if (event.target.closest("a")) {
      document.body.classList.remove("sidebar-toggled");
    }
  });
});
