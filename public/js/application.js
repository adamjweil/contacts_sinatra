  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  var ajaxDoneHandler = function(response, $this) {
    console.log(response)

    var html =
    '<div class = "contact-details">' +
        '<ul>' +
          '<li>First Name: ' + response.first_name + '</li>' +
          '<li>Last Name: ' + response.last_name + '</li>' +
        '</ul>' +
    '</div>'
    $this.closest('li').append(html)
  }

  var showClickHandler = function(e) {
    e.preventDefault()
    var $this = $(this)
    var ajax_options = {
      url: $this.attr('href'),
      headers: { Accept: 'application/json' },
      dataType: 'json'
    }

      $.ajax(ajax_options)
        .done(function(response){ ajaxDoneHandler(response, $this) })
  }

  var bindClickEvents = function() {
    $('li').find('a:first').on('click', showClickHandler)
  }

  $(document).ready(function() {
    bindClickEvents()
  });
