# Strftimes Like These

https://strftimeslikethese.com

A proof of concept ruby WASM implementation of https://foragoodstrftime.com, but without a ruby server running in the backend.

This repository was generated from the brilliant [bormashino-app-template](https://github.com/keyasuda/bormashino-app-template).

## Development Notes

Much of the work was based not only from the template above, but also in keyasuda's other bormashino apps, like https://github.com/keyasuda/bormashino-todomvc.

These projects depend on the [bormashino gem](https://github.com/keyasuda/bormashino), which as of this writing only works in Linux, hence why [I've forked it to make it work in my M1 Macbook Air](https://github.com/keyasuda/bormashino/compare/main...bbonamin:macos-compatibility?expand=1). It's likely that updating the Gemfile in this project to not use the fork will allow building in Linux.

## Prerequisites

- rbenv + ruby-build
- npm

## Quickstart

```bash
brew install overmind
rbenv install 3.2.0-preview1

bundle install
bundle exec rake bormashino:download
bundle exec rake "bormashino:digest[tmp]"
(cd src && bundle install)
npm install

bin/dev # it will fail, stop with Ctrl+C. Maybe if tmp/ is created beforehand it could be fixed?
bundle exec rake "bormashino:digest[tmp]"

bin/dev # now it should work OK.
```

You can see the app at http://localhost:5431/.
App code can be found in `src/`.
