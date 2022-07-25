let searchComent1 = document.getElementById("animation-coment1");
let searchComent2 = document.getElementById("animation-coment2");
let searchComent3 = document.getElementById("animation-coment3");

let siteMapButton = document.getElementById('site-map-button');

window.addEventListener('scroll', () => {
  let scrollValue = window.scrollY;
  console.log(scrollValue);
  
  if(scrollValue > 1000) {
    searchComent1.style.animation = 'fadein 1.5s ease-out';
  } else {
    searchComent1.style.animation = 'fadeout 1.5s ease-out';
  }
})

window.addEventListener('scroll', () => {
  let scrollValue = window.scrollY;
  console.log(scrollValue);

  if(scrollValue > 1700) {
    searchComent2.style.animation = 'fadein 1.5s ease-out';
  } else {
    searchComent2.style.animation = 'fadeout 1.5s ease-out'
  }
})

window.addEventListener('scroll', () => {
  let scrollValue = window.scrollY;
  console.log(scrollValue);
  if(scrollValue > 2400) {
    searchComent3.style.animation = 'fadein 1.5s ease-out';
  } else {
    searchComent3.style.animation = 'fadeout 1.5s ease-out';
  }
})

siteMapButton.addEventListener('click', () => {
  let nav_site__map_id = document.getElementById("nav-site__map_id");
  nav_site__map_id.classList.toggle("clicked");
  console.log("!");
})

