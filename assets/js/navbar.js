document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("navbar-toggle").onclick = function() {
    this.classList.toggle("is-active");
    document.getElementById("navbar-menu").classList.toggle("is-active");
  };
});
