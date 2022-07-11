const menuBar = document.getElementById("menu_bar");
menuBar.addEventListener('click', () => {
  let gnbDropDown = document.getElementById("gnb_drop_down");
  gnbDropDown.classList.toggle("gnb-focus");
  menuBar.classList.toggle("manubar-focus");
})

