$(document).on('click', '.tab-menu__item', function() {
  var target = $(this).attr('target');
  $(this).parent('.tab-menu').find('.tab-menu__item').removeClass('selected');
  $(this).addClass('selected');

  $(this).parent('.tab-menu').parent('.tabs').find('.tab-content').addClass('hidden');
  $(target).removeClass('hidden');
})

$(document).on('click', '.card .row', function(){
  $('.video-info').slideUp()
  $(this).find('.video-info').slideToggle()
  if($(this).find('.arrow').css('transform') == 'matrix(0.707107, -0.707107, 0.707107, 0.707107, 0, 0)'){
    $(this).find('.arrow').css('transform','rotate(-135deg)')
  }
  else{
    console.log($(this).find('.arrow').css('transform'))
    $(this).find('.arrow').css('transform','rotate(-45deg)')
  }
})
