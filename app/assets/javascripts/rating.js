$(document).on('turbolinks:load', function() {
  var load_image_star= function(length) {
    $.each($('.star-review'), function(index, key){
      if (index < length){
        $(key).attr('src', I18n.t('star_on'));
      }else {
        $(key).attr('src', I18n.t('star_off'));
      }
    });
  }

  $('.star-review').hover(function() {
    load_image_star($(this).attr('alt'));
  });

  $('.star-review').mouseleave(function() {
    load_image_star($('#comment_rating').val());
  });

  $('.star-review').click(function() {
    var value = $(this).attr('alt');
    $('#comment_rating').val(value);
    load_image_star(value);
  });
});
