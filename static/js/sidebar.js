document.addEventListener("DOMContentLoaded", () => {
  const toggleBtn = document.getElementById("sidebar-toggle");
  const sidebar = document.getElementById("sidebar");

  toggleBtn.addEventListener("click", () => {
    document.body.classList.toggle("sidebar-toggled");
  });

  sidebar.addEventListener("click", (event) => {
    // Check if the clicked element is an <a> tag (or inside one)
    if (event.target.closest("a")) {
      // Remove the class to hide the sidebar on all devices
      document.body.classList.remove("sidebar-toggled");
    }
  });
});
