$(document).on('click', '.tab-menu__item', function() {
  var target = $(this).attr('target');
  $(this).parent('.tab-menu').find('.tab-menu__item').removeClass('selected');
  $(this).addClass('selected');

  $(this).parent('.tab-menu').parent('.tabs').find('.tab-content').addClass('hidden');
  $(target).removeClass('hidden');
})

$(document).on('click', '.card .row', function(){
  var currentRow = $(this).find('.video-info')
  var rowArrow = $(this).find('.arrow')

  $('.video-info').not(currentRow).slideUp()
  currentRow.slideToggle()

  $('.arrow').not(rowArrow).css('transform','rotate(-45deg)')

  if(rowArrow.css('transform') == 'matrix(0.707107, -0.707107, 0.707107, 0.707107, 0, 0)'){
    rowArrow.css('transform','rotate(-135deg)')
  }
  else{
    rowArrow.css('transform','rotate(-45deg)')
  }
})
