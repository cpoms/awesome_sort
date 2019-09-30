# AwesomeSort

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/awesome_sort`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'awesome_sort'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install awesome_sort

## Usage

Include 

```ruby
AwesomeSort::AwesomeSortHelper
```
in your application_helper file.

Include awesome_sort in your javascript and css application files

In config/initializers, create an awesome_sort with similar syntax:
```ruby
AwesomeSort.configure do |config|
  config.add_sorter(
    :contacts,
    :name,
    ->(scope, direction){ scope.order(surname: direction, forename: direction) }
  )

  config.add_sorter(
    :contacts,
    :organisations,
    ->(direction){ scope.eager_load(:clients).order("institute.name #{direction}") }
  )

  config.defaults[sort_by: 'name'] or config.defaults = { sort_order: 'desc', sort_by: 'dob' }
end
```

In the view, when creating columns for the table, use the following syntax:
```ruby
  <%= column_sort(
    column_name: "title",
    width: "10%",
    link_name: "Title",
    controller_name: "contact_index",
    extra: { search: @search }) %>
```
where: <br />
  "column_name" will be the name of your db column <br />
  "width" will be your column width <br />
  "link_name" will be the name of the column displayed as a link <br />
  "controller_name" will be the controller name for logic <br />
  "extra" pass in there extra parameters <br />

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/awesome_sort. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AwesomeSort project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/awesome_sort/blob/master/CODE_OF_CONDUCT.md).
