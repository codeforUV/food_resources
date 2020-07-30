# Food Resources

## Background

This is a project of [Code for UV](http://www.codeforuv.org/) in partnership with [Little Rivers Health Care](https://www.littlerivers.org/).

Code for UV is a [Code for America](https://www.codeforamerica.org/) Brigade based in the Upper Valley region of New Hampshire and Vermont.The Upper Valley is a rural area, and many families live in a food desert, meaning they are 10 miles or more away from food, especially fresh produce. Our app aims to support Little Rivers' goal of increasing food access for residents of this region by producing an online guide to local food resources that is up-to-date, searchable, mobile-friendly, and offline-accessible.

## Developer Setup

### Prerequisites
- [Ruby](https://ruby-doc.org/) 2.6.5
- [Bundler](https://bundler.io/) 2.1.4: `gem install bundler`
- [RubyGems](https://rubygems.org/pages/download) 2.5.0 or higher
  - Check your current version: `gem --version`
  - If needed, update version: `gem update --system`
- [Node](https://nodejs.org/en/download/) 10.15.3
- [Yarn](https://classic.yarnpkg.com/en/docs/install)
  - Recommend installing via [homebrew](https://brew.sh/): `brew install yarn`
- [PostgreSQL](https://www.postgresql.org/) 12.3
  - Recommend installing via [homebrew](https://brew.sh/): `brew install postgresql@12.3`

### Running the app locally
- Install dependencies: `bundle install`
- Setup database: `rails db:setup`
- Start server: `rails s`
- Visit `localhost:3000` to see the app

### Deployment
- This app is hosted on Heroku. Merging PRs to the `master` branch triggers an auto-deploy

## Wireframe Designs
Wireframe designs can be found in [lib/wireframes](lib/wireframes)
