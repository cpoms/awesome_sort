require "awesome_sort/version"
require "awesome_sort/engine" if defined?(::Rails)
require "active_support/core_ext/module"

module AwesomeSort
  mattr_accessor :sorters, :defaults

  def self.configure
    yield self
  end

  def self.add_sorter(model, attribute, sorter)
    self.sorters[model] ||= {}
    self.sorters[model][attribute] = sorter
  end

  def self.set_default(model, attribute_or_sorter)
    self.defaults[model] = attribute_or_sorter
  end
end

AwesomeSort.defaults = {}
AwesomeSort.sorters = {}
