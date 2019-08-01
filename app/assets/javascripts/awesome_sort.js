function orderable() {
  // Orderable tables, only one per page atm.
  if ($('.orderable').length && window.location.search) {
    var order_terms = window.location.search.match(/sort_by=(\w+)($|&)/);
    var order_term = order_terms ? order_terms[1] : undefined;

    var order_directions = window.location.search.match(/sort_order=(\w+)($|&)/);
    var order_direction = order_directions ? order_directions[1] : undefined;

    if (order_term) {
      $('.orderable').each(function() {
        if ($(this).data('order-term') == order_term) {
          $(this).addClass('order-' + order_direction);
        } else {
          $(this).removeClass('order-asc');
          $(this).removeClass('order-desc');
        }
      });
    }
  }

  $(".orderable").each(function() {
    var url = new URL(window.location)
    url.searchParams.append('sort_by', $(this).data('order-term'))
    url.searchParams.append('sort_order', $(this).hasClass('order-asc') ? 'desc' : 'asc')

    var element = $(this).has('> a').length ? $(this).children('a') : $(this).wrapInner($('<a/>'))
    element.attr('href', url.toString());
  });
};

function fireEvent(event) {
  var e = new Event(event)
  window.dispatchEvent(e)
}

// Have to manually fire event when history is updated (url changes)
var _pushState = history.pushState;
history.pushState = function() {
  _pushState.apply(history, arguments);
  fireEvent('pushState');
};

window.addEventListener('pushState', function() {
  orderable()
})
