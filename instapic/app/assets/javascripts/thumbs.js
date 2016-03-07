$(document).ready(function() {

  $('.thumbs-link').on('click', function(event){
      event.preventDefault();

      var thumbCount = $(this).siblings('.thumbs_count');

      $.post(this.href, function(response){
        thumbCount.text(response.new_thumb_count);
    })
  })
})
