[![Ruby Version](https://img.shields.io/badge/ruby-~%3E%202.5-red.svg)]()
[![Gem](https://img.shields.io/gem/v/react-rails-api.svg)](https://rubygems.org/gems/react-rails-api)
[![License](https://img.shields.io/github/license/eonu/react-rails-api.svg)](https://github.com/eonu/react-rails-api/blob/master/LICENSE)

# React-Rails API

All-in-one application generator enabling the integration of a React front-end and a Ruby-on-Rails API back-end with a CMS via ActiveAdmin.

---

<p align="center">
    <img width="600px" src="https://i.ibb.co/9y3jyBK/react-rails-api.png">
    <p align="center"><em>Image courtesy of <a href="https://heroku.com">Heroku</a>.</em></p>
</p>

This is an easy-to-use generator to implement the modern web application stack described [here](https://blog.heroku.com/a-rock-solid-modern-web-stack), by Heroku designer Charlie Gleason.

## Requirements

- [**Ruby**](https://www.ruby-lang.org/en/) `~> 2.5`
- [**Rails**](https://rubyonrails.org/) `~> 5.2`
- [**Node**](https://nodejs.org/en/) `11.11.0`: *Recommend installing this with [NVM](https://github.com/creationix/nvm).*
- [**Yarn**](https://yarnpkg.com/en/) `1.13.0`: *Recommend installing Node separately from this, rather than as a dependency.*

## Installation

```
$ gem install react-rails-api
```

## Usage

```bash
$ react-rails

Commands:
  react-rails new [PATH]   # Initialise a React/Rails API application.
  react-rails version, -v  # Display installed react-rails version.

Options:
  [--database], [--no-database]  # Integrate ActiveRecord (and Postgres).
                                 # Default: true
```

If the `--database` flag is set to true (which is the default), a prompt will also ask if you'd like to integrate [ActiveAdmin](https://activeadmin.info/) into the application.

## More information

For more information about how to use this stack, please read [this blog post](https://blog.heroku.com/a-rock-solid-modern-web-stack).