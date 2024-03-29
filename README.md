# Usefultag
Let Ruby on Rails ActiveRecord has many useful tags.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'usefultag'
```

And then execute:
```bash
bundle
rails usefultag:install:migrations
rails db:migrate
```

## AcitveController

``` ruby
private
def book_params
  ...
  book_tags: []
  ...
end
```

## AcitveRecord Model

``` ruby
has_many_useful_tags :book_tags

# Mode methods
book_tags_str('-')
#=> tag1-tag2-tag3
book_tags_str
#=> tag1,tag2,tag3
```

## View

``` html+erb
<%= form_with(model: book, local: true) do |form| %>
  ...
  <div class="field">
    <%= form.label :book_tags %>
    <%= form.useful_tags_field :book_tags %>
  </div>
  ...
<% end %>
```

This will generate a input, all available tags will pop up when foucs on the
input.

Just click on those added tags for remove them.

Remember to permit params in Controller

## Scope

``` ruby
class Comment < ApplicationRecord
  belongs_to :post
  has_many_useful_tags :tags, scope: :post_id
end
```

This can set every post have diffrent tags on comments.

``` html+erb
<%= form_with(model: comment, local: true) do |form| %>
  ...
  <div class="field">
    <%= form.label :tags %>
    <%= form.useful_tags_field :tags, scope: comment.post_id %>
  </div>
  ...
<% end %>

```

## Manage Tags
Mount usefultag to main app route.

``` ruby
Rails.application.routes.draw do
  mount Usefultag::Engine => "/usefultag"
end
```

## Contributing

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
