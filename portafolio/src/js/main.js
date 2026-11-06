const root = document.documentElement;
const themeButton = document.querySelector(".theme-toggle");
const menuButton = document.querySelector(".menu-toggle");
const navLinks = document.querySelector(".nav-links");

function setTheme(theme) {
  root.dataset.theme = theme;
  const isDark = theme === "dark";
  themeButton.innerHTML = `<i data-lucide="${isDark ? "sun" : "moon"}"></i>`;
  themeButton.setAttribute("aria-label", `Switch to ${isDark ? "light" : "dark"} theme`);
  localStorage.setItem("portfolio-theme", theme);
  if (window.lucide) lucide.createIcons();
}

const savedTheme = localStorage.getItem("portfolio-theme");
setTheme(savedTheme || "dark");

themeButton.addEventListener("click", () => {
  setTheme(root.dataset.theme === "dark" ? "light" : "dark");
});

menuButton.addEventListener("click", () => {
  const isOpen = navLinks.classList.toggle("is-open");
  menuButton.setAttribute("aria-expanded", String(isOpen));
  menuButton.setAttribute("aria-label", isOpen ? "Close navigation menu" : "Open navigation menu");
  menuButton.innerHTML = `<i data-lucide="${isOpen ? "x" : "menu"}"></i>`;
  if (window.lucide) lucide.createIcons();
});

navLinks.querySelectorAll("a").forEach(link => {
  link.addEventListener("click", () => {
    navLinks.classList.remove("is-open");
    menuButton.setAttribute("aria-expanded", "false");
    menuButton.setAttribute("aria-label", "Open navigation menu");
    menuButton.innerHTML = '<i data-lucide="menu"></i>';
    if (window.lucide) lucide.createIcons();
  });
});

document.querySelector("#year").textContent = new Date().getFullYear();

if ("IntersectionObserver" in window) {
  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("is-visible");
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12 });
  document.querySelectorAll(".reveal").forEach(element => observer.observe(element));
} else {
  document.querySelectorAll(".reveal").forEach(element => element.classList.add("is-visible"));
}

if (window.lucide) lucide.createIcons();
