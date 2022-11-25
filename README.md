# Dan Cecile's resume + portfolio site
_An interactive and printable webpage made with Elm_

[![Build Status](https://semaphoreci.com/api/v1/dcecile/dcecile-resume-portfolio/branches/master/badge.svg)](https://semaphoreci.com/dcecile/dcecile-resume-portfolio)

## Setup

1. Install [Git Large File Storage](https://git-lfs.github.com/) (used for
   binary assets)
1. Install the [direnv](https://direnv.net/) (used to put Elm in `PATH`)
1. Install the [PNPM](https://pnpm.io/) (used to install Elm)
1. Run `pnpm install` to install all NPM dependencies
1. [Set up your
   editor](https://github.com/avh4/elm-format#detailed-instructions) to
   automatically run `elm-format` on save

## Developing

PNPM commands:

- `pnpm dev`: start the development server
- `pnpm watch`: start running tests
- `pnpm fmt`: format all files
- `pnpm check`: pre-commit check (formatting, warnings, tests)

_Hint: to view the resume directly as a webpage (without printing), use
the special `#resume` hash URL._

For other operations, see the [Create Elm App
README](https://github.com/halfzebra/create-elm-app/tree/master/template).

## Deploying

This Elm app compiles into a single static webpage (plus assets), so
deploying means running `pnpm build`, then putting all the files
from the `./build/` folder onto your web server.

- The app does not use the History API for URL rewriting, so no custom
  routing rules are needed
- The app is configured to be served directly from the `/` path

If you want to deploy to [GitHub pages](https://pages.github.com/), you
can try using an automated script like the GitHub Action:

> [.github/workflows/main.yaml](.github/workflows/main.yaml)

Optional environment variables (set these before running `pnpm build`):

- `ELM_APP_PORTFOLIO_GOOGLE_VERIFICATION` for Google Search Console
  verification


## Credits

Font: [Source Sans Pro](https://github.com/adobe-fonts/source-sans-pro)

Icons: [Feather](https://feathericons.com/), [Font
Awesome](https://fontawesome.com/)

## License

This project is released under the MIT License (see
[LICENSE.md](LICENSE.md) for details).
