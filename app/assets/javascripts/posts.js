$( document ).ready(function() {
  var loading = false;
  //infinite scrolling
  if ($('#paginate-infinite-scrolling').size() > 0) {
    $(window).on('scroll', function() {
      if (loading) {
        return;
      }
      var page = $('#paginate-infinite-scrolling').data('page');
      var more_posts_url = '/?page=' + page;
      if (more_posts_url && ($(window).scrollTop() > $(document).height() - $(window).height() - 60)) {
        loading = true;
        $('#paginate-infinite-scrolling').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />');
        $.getScript(more_posts_url, function() {
          loading = false;
        });
      }
    });
  };

  //hide or show the "back to top button" depending on scroll from top
  $(window).scroll(function(){
    if ($(this).scrollTop() > 800 ) {
      $('.back-to-top-button').removeClass('hidden');
    } else {
      $('.back-to-top-button').addClass('hidden');
    }
  });

  //smooth scroll to top
  $('.back-to-top-button').on('click', function(event){
    event.preventDefault();
    $('body,html').animate({
      scrollTop: 0
      }
    );
  });

});

