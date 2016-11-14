$(document).on('turbolinks:load', function() {
  $('.fa.fa-angle-double-down').click(function(){
    if ($('#order_detail') !== null) $('#order_detail').remove();
    order_id = $(this).attr('id');
    $.ajax({
      url: '/api/orders/' + order_id,
      method: 'GET',
      success: function(data){
        $('#list_order_detail_'+order_id).show(300);
        $('div#list_order_detail_'+ order_id).append(data);
      }
    });
  });
});
