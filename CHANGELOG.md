# 0.1.4

#### Major changes

- Add MIT license to the client-level `package.json`. ([#13](https://github.com/eonu/react-rails-api/pull/13))
- Change `npm run postinstall` to `yarn postinstall` in `start` rake task. ([#14](https://github.com/eonu/react-rails-api/pull/14))

#### Minor changes

- Use idiomatic hash notation in `start.rake.tt`. ([#15](https://github.com/eonu/react-rails-api/pull/15/))

# 0.1.3

#### Major changes

- Stop spring before ActiveAdmin install to prevent an asset generation error. ([#11](https://github.com/eonu/react-rails-api/pull/11))
- Change **Yarn** version specifier to `^1.13`. ([#11](https://github.com/eonu/react-rails-api/pull/11))
- Change **Node** version specifier to `^11`. ([#11](https://github.com/eonu/react-rails-api/pull/11))

#### Minor changes

- Move **Yarn** and **Node** engine version specifiers to `version.rb`. ([#11](https://github.com/eonu/react-rails-api/pull/11))
- Add `modify_json` method for modifying JSON files (to prevent the overwriting of `package.json`). ([#11](https://github.com/eonu/react-rails-api/pull/11))

# 0.1.2

#### Major changes

- Force top-level `package.json` to be overwritten if it already exists. ([#7](https://github.com/eonu/react-rails-api/pull/7))

#### Minor changes

- Remove Charlie Gleason as an author (in Gemspec). ([#8](https://github.com/eonu/react-rails-api/pull/8))

# 0.1.1

#### Major changes

- Add `foreman` gem, along with `start:development` and `start:production` tasks (via `rake`) for running development and production builds with `Procfile`s. ([#3](https://github.com/eonu/react-rails-api/pull/3))
- Make the top-level CLI command display help specifically for the `react-rails new` command. ([#4](https://github.com/eonu/react-rails-api/pull/4))
- Hide the CLI `version`, `--version`, `-v` command from the help interface. ([#4](https://github.com/eonu/react-rails-api/pull/4))

#### Minor changes

- Change API scope parameter to a symbol: `'/api'` -> `:api`. ([#1](https://github.com/eonu/react-rails-api/pull/1))
- Add `rake` task descriptions for running development and production builds. [[`README.md`](https://github.com/eonu/react-rails-api/pull/2/files#diff-04c6e90faac2675aa89e2176d2eec7d8)] ([#2](https://github.com/eonu/react-rails-api/pull/2))
- Add Charlie Gleason's medium article as a reference. [[`README.md`](https://github.com/eonu/react-rails-api/pull/2/files#diff-04c6e90faac2675aa89e2176d2eec7d8)] ([#2](https://github.com/eonu/react-rails-api/pull/2))

# 0.1.0

#### Major changes

Nothing, initial release! 🎉