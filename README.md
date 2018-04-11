# Dan Cecile's resume + portfolio site
_An interactive and printable webpage made with Elm_

[![Build Status](https://semaphoreci.com/api/v1/dcecile/dcecile-resume-portfolio/branches/master/badge.svg)](https://semaphoreci.com/dcecile/dcecile-resume-portfolio)

## Developing

1. Install [Git Large File Storage](https://git-lfs.github.com/) (used for
   binary assets)
2. Install the [Yarn](https://yarnpkg.com/en/docs/install) package manager
3. Run `yarn` to install all NPM dependencies
4. [Set up your
   editor](https://github.com/avh4/elm-format#detailed-instructions) to
   automatically run `elm-format` on save
5. Run `./start-dev.sh` to start the development server or run
   `./start-test.sh` to start running tests
6. Change a source file, and the app will reload automatically
7. Run `./format-js.sh` to refromat JS code according to
   [Prettier](https://prettier.io/) rules
8. Run `./check-all.sh` to run all pre-commit checks (formatting,
   warnings, and tests)

_Hint: to view the resume directly as a webpage (without printing), use
the special `#resume` hash URL._

For other operations, see the [Create Elm App
README](https://github.com/halfzebra/create-elm-app/tree/master/template).

## Deploying

This Elm app compiles into a single static webpage (plus assets), so
deploying means running `yarn elm-app build`, then putting all the files
from the `./build/` folder onto your web server.

- The app does not use the History API for URL rewriting, so no custom
  routing rules are needed
- The app is configured to be served directly from the `/` path

If you want to deploy to [GitHub pages](https://pages.github.com/), you
can try using an automated script like this Gist:

> https://gist.github.com/dcecile/b03ea8c5a807ca1ff8068908ce669d54

Optional environment variables (set these before running `yarn elm-app
build`):

- `ELM_APP_PORTFOLIO_GOOGLE_VERIFICATION` for Google Search Console
  verification


## Credits

Font: [Source Sans Pro](https://github.com/adobe-fonts/source-sans-pro)

Icons: [Feather](https://feathericons.com/), [Font
Awesome](https://fontawesome.com/)

## License

This project is released under the MIT License (see
[LICENSE.md](LICENSE.md) for details).
