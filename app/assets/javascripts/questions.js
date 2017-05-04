$(document).on('ready', function () {
  $('.add_comment').on('click', function (e) {
    e.preventDefault();
    $(this).next().slideToggle();
  })
})