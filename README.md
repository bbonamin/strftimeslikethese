# bormashino-app-template

template repository of apps with Bormaŝino / SPAs written in Ruby

## Demo

https://bormashino-app-template.vercel.app

## Prerequisites

You need:

- rbenv + ruby-build
- npm
- Vercel CLI (optional, when you want to deploy the app into Vercel)

## Quickstart

in the template dir

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
App codes are basically in `src/`.
