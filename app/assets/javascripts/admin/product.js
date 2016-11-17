$(document).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
          $('#image-product').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('#product_image').change(function(){
      readURL(this);
  });

  $('.ckeditor').ckeditor({
  });
});
function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp('new_' + association, 'g')
  $(link).parent().before(content.replace(regexp, new_id));
}

function remove_fields(link) {
  $(link).prev('input[type=hidden]').value = '1';
  $(link).closest('.form-group').remove();
}
