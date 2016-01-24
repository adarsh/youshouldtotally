$(function() {

  $("#television_show_title").autocomplete({
    source: function(request, response) {
      $.get(
        "https://api.themoviedb.org/3/search/tv?api_key=e97858344ce2a799f9603fd8efd5f013",
        { query: request.term },

        function(data) {
          response(data);
        });
    },

    minLength: 2,

    open: function(event, ui) {
      $(".ui-autocomplete").css("z-index", 1000);
    }
  });
});
