# BcmsBitly

This gem will automatically create a Bitly short link when a new page is created.

## Installation

Add this to your Gemfile:

```
gem 'bcms_bitly'
```

and then run:


```
bundle install
rails g cms:install bcms_bitly
rake db:migrate
```

This will create an initializer file at `config/initializers/bcms_bitly.rb`. You will need to change the username and api key values to your Bitly credentials:

```
module BcmsBitly
  class Engine < ::Rails::Engine
    config.bitly_username = 'username'
    config.bitly_api_key  = 'api_key'
  end
end
```

## Usage

After creating a new page, the shortened link will be available through the `short_link` association:

```
@page.short_link.url
```

## License

(The MIT License)

Copyright © 2012 Josiah Ivey

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.