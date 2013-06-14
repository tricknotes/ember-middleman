# Ember::Middleman

[![Build Status](https://travis-ci.org/tricknotes/ember-middleman.png?branch=master)](https://travis-ci.org/tricknotes/ember-middleman)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/tricknotes/ember-middleman/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

ember-middleman supports using Ember.js with Middleman in easily.
You can use this with [hamlbars](https://github.com/jamesotron/hamlbars) if you like.

_This gem is inspired by [ember-rails](http://github.com/emberjs/ember-rails)._

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'ember-middleman'
gem 'ember-source', '1.0.0.rc5' # the version you requires
```

Execute:

``` sh
$ bundle
```

Or install it yourself as:

``` sh
$ gem install ember-middleman
```

## Features

When you installed ember-middleman, the following features help you.

### Path to libraries

You can use Ember.js, handlebars and ember-data.
Please write the followings to your `application.js` (or something you use):

``` javascript
//= require handlebars
//= require ember
//= require ember-data
```

### handlebars compilation

You can use handlebars as your template language for Ember.js.

``` sh
$ mkdir -p source/javascripts/templates
```

And put your template.

For example:

* `source/javascripts/templates/ok_button.js.handlebars`

``` handlebars
<div>
  <button {{action someAction}}>OK</button>
</div>
```

It automatically set as `Ember.TEMPLATES['ok_button']`.

## Tests

``` sh
bundle exec rake
```

## Known issues

* Many code are duplicated with ember-rails
* generator is required

## Example Repository

* [sapporojs.org](https://github.com/sapporojs/sapporojs.org)
