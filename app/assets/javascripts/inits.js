$(function () {
	$('.dropdown-trigger').dropdown({
      inDuration: 300,
      outDuration: 225,
      constrainWidth: false, // Does not change width of dropdown to that of the activator
      gutter: 0, // Spacing from edge
      belowOrigin: true, // Displays dropdown below the button
      alignment: 'left', // Displays dropdown with edge aligned to the left of button
      stopPropagation: false // Stops event propagation
    }
  );
  $('select').material_select();
  $(".sidemenu-trigger").sideNav();
  $('.tooltipped').tooltip({delay: 50});
})