[![Ruby Version](https://img.shields.io/badge/ruby-~%3E%202.5-red.svg)](https://github.com/eonu/react-rails-api/blob/38f50a1d30f33cf7b818a5c939fe5d99c1a758a2/react-rails-api.gemspec#L20)
[![Gem](https://img.shields.io/gem/v/react-rails-api.svg)](https://rubygems.org/gems/react-rails-api)
[![License](https://img.shields.io/github/license/eonu/react-rails-api.svg)](https://github.com/eonu/react-rails-api/blob/master/LICENSE)

# React-Rails API

All-in-one application generator enabling the integration of a React front-end and a Ruby-on-Rails API back-end with a CMS via ActiveAdmin.

<p align="center">
    <img width="500px" src="https://i.ibb.co/9y3jyBK/react-rails-api.png">
    <p align="center"><em>Image courtesy of <a href="https://heroku.com">Heroku</a>.</em></p>
</p>


This is an easy-to-use generator to implement the modern web application stack described [here](https://blog.heroku.com/a-rock-solid-modern-web-stack) by Heroku designer Charlie Gleason.

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
$ react-rails -h
Commands:
  react-rails [PATH]       # Initialise a React/Rails API application.

Options:
  [--database], [--no-database]  # Integrate ActiveRecord (and Postgres).
                                 # Default: true
```

### Creating an application

```bash
$ react-rails my-demo-app
```

If the `--database` flag is set to true (which is the default), a prompt will also ask if you'd like to integrate [ActiveAdmin](https://activeadmin.info/) into the application.

If you would not like to integrate ActiveRecord (and a Postgres database), make sure to use the `--no-database` flag:

```bash
$ react-rails my-demo-app --no-database
```

### Running an application

There are two `rake` tasks that allow you to run development and production builds of an application (using [Foreman](https://github.com/ddollar/foreman)):

- `start:development` - Starts a development build of the application (running `Procfile.dev`).
- `start:production` - Starts a production build of the application (running `Procfile`).

## More information

For more information about how to use this stack, please read the following blog posts by Charlie Gleason:

- https://blog.heroku.com/a-rock-solid-modern-web-stack
- https://medium.com/superhighfives/a-top-shelf-web-stack-rails-5-api-activeadmin-create-react-app-de5481b7ec0b