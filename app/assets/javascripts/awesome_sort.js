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
    if ($(this).hasClass('order-asc')) {
      var link = window.location.pathname + '?sort_by=' + $(this).data('order-term') + '&sort_order=desc' + window.location.hash
    } else {
      var link = window.location.pathname + '?sort_by=' + $(this).data('order-term') + '&sort_order=asc' + window.location.hash
    }
    $(this).wrapInner($('<a/>').attr('href', link));
  });
};
