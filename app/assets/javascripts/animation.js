$(document).on('turbolinks:load', function() {
  $(window).scroll(function(){
    current_location = $('body').scrollTop();
    newest_hight =
      $('.newest-product').offset().top - parseInt(I18n.t('default_hight'));
    best_hight =
      $('.best-product').offset().top - parseInt(I18n.t('default_hight'));
    recent_view_hight =
      $('.recent-view-product').offset().top - parseInt(I18n.t('default_hight'));

    if(current_location < newest_hight){
      $('.newest-product').removeClass('turn-out');
    }
    else{
      $('.newest-product').addClass('turn-out');
    }

    if(current_location < best_hight){
      $('.best-product').removeClass('turn-out');
    }
    else{
      $('.best-product').addClass('turn-out');
    }

    if(current_location < recent_view_hight){
      $('.recent-view-product').removeClass('turn-out');
    }
    else{
      $('.recent-view-product').addClass('turn-out');
    }
  });
});
