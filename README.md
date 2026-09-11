# Documentation for KDRS Search & View

This repo contains a Jekyll page with documentation for KDRS Search & View, using [Just the Docs](https://just-the-docs.com/) as a theme.

## Development
To run a local server with the page:

~~~ sh
git clone https://github.com/KDRS-SA/kdrs-search-and-view-docs
cd kdrs-search-and-view-docs
bundle install
jekyll serve --host 0.0.0.0
~~~
*Option `--host 0.0.0.0` is required when running the local server in a VM with a separate network to listen for requests from the host computer.*

The browser refreshes itself whenever the site rebuilds. This comes from `livereload` in `_config.yml`, and uses port 35729 alongside 4000.

## Template data

`_data/templates.yml` is a copy of `vendor/available-templates/templates.yml` in SV.

`_data/templates_override.yml` sets display flags per template:

- `hidden: true` — hides the template
- `new: true` — marks the card `ny`

## Branches and deployment

The GitHub workflow at `.github/workflows/kdrs_multi_version_build_deploy.yml` is configured to automatically deploy the latest version, determined by the highest semantic version number in the branch names. For example, if branches `1.4` and `2.1` exist, `2.1` will be deployed to the root. While branches are in development, they will therefore be prefixed like `develop/x.y` so they will not be deployed as the main page before they are ready. Branches starting with `develop/` will be deployed still and manually accessible by visiting the url `https://sv.kdrs.no/develop/<yourbranchname>`, but not visible in the version selector.

All branches on the format `x.y` will be available in the version selector on the page, so the users can view documentation for older versions.