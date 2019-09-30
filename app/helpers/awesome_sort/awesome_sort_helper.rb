module AwesomeSort
  module AwesomeSortHelper
    def column_sort(args = {})
      args[:extra] ||= {}
      defaults = AwesomeSort.defaults

      # Should pass it column_name, link_name, controller_name and
      # optionally width, html_options and header_classes
      args.reverse_merge!(header_classes: [], html_options: {})
      sort_order = args[:sort_order] || defaults[:sort_order]

      c_method = args[:controller_name] + "_path"
      klass = ["orderable"]
      klass << "order-#{sort_order}" if args[:sort_by] == args[:column_name]
      klass << args[:header_classes]
      klass.flatten

      content_tag(:th, width: args[:width], class: klass, data: { order_term: args[:column_name] }) do
        link_to(
          args[:link_name],
          public_send(c_method, { sort_order: sort_order, sort_by: args[:column_name] }.merge(args[:extra])),
          { remote: true }.merge(args[:html_options])
        )
      end
    end

    def sort(scope, sort_by, sort_order)
      klass = scope.model.name.tableize.to_sym
      defaults = AwesomeSort.defaults

      if sort_by
        if sorter = AwesomeSort.sorters[klass][sort_by.to_sym]
          sorter.call(scope, sort_order)
        else
          scope.order(sort_by => sort_order)
        end
      else
        own_defaults = defaults[klass]

        if (default_sorter = own_defaults ? own_defaults[:sort_by] : defaults[:sort_by])
          if default_sorter.respond_to?(:call)
            default_sorter.call(scope)
          else
            scope.order(default_sorter => (own_defaults ? defaults[klass][:sort_order] : defaults[:sort_order]))
          end
        else
          scope
        end
      end
    end
  end
end
