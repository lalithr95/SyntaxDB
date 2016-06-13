# Syntaxdb

Ruby client which supports SyntaxDB API. [SyntaxDB](https://syntaxdb.com/) allows to programmers to search for syntax in various languages easily.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'syntaxdb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install syntaxdb

## Usage

`all()`
The Languages endpoint returns all languages available on Syntaxdb, sorted by position by default. 

**Parameter: fields, limit, sort**
```ruby
Syntaxdb::Language.all
```

`find()`
Returns the language corresponding to the permalink along with its information.

**Parameter: language_permalink(required), fields, limit, sort**
```ruby
Syntaxdb::Language.find({language_permalink: 'java'})
```

`find_categories()`
The language categories endpoint returns all of the categories corresponding to the language.

**Parameter: language_permalink(required), fields, limit, sort**
```ruby
Syntaxdb::Language.find_categories({
    language_permalink: 'java'
})
```

`find_concepts()`
The category concepts endpoint returns all concepts belonging to the category, sorted by position by default.

**Parameter: language_permalink(required), category_id(required), fields, limit, sort**
```ruby
Syntaxdb::Language.find_concepts({
    language_permalink: 'java', 
    category_id: 1
})
```

`find_concepts()`
The language concepts endpoint returns all concepts belonging to the language, sorted by position by default.

**Parameter: language_permalink(required), fields, limit, sort**
```ruby
Syntaxdb::Language.find_concepts({ language_permalink: 'java' })
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/syntaxdb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

SyntaxDB API copyrights © 2016 SyntaxDB