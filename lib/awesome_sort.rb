require "awesome_sort/version"
require "awesome_sort/engine" if defined?(::Rails)
require "active_support/core_ext/module"

module AwesomeSort
  mattr_accessor :sorters, :defaults

  def self.configure
    self.sorters = {}
    self.defaults = { sort_order: 'asc', sort_by: 'name' }
    yield self
  end

  def self.add_sorter(model, attribute, sorter)
    self.sorters[model] ||= {}
    self.sorters[model][attribute] = sorter
  end
end
