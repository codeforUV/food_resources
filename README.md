# Food Resources

## Background

This is a project of [Code for UV](http://www.codeforuv.org/) in partnership with [Little Rivers Health Care](https://www.littlerivers.org/).

Code for UV is a [Code for America](https://www.codeforamerica.org/) Brigade based in the Upper Valley region of New Hampshire and Vermont. The Upper Valley is a rural area, and many families live in a food desert, meaning they are 10 miles or more away from food, especially fresh produce. Our app aims to support Little Rivers' goal of increasing food access for residents of this region by producing an online guide to local food resources that is up-to-date, searchable, mobile-friendly, and offline-accessible.

## Developer Setup
This is assuming that you are running this on a Mac. If you are on a Windows machine, you may want to first install WSL2 (Windows Subsystem for Linux 2), and then you should be able to follow these steps.

### Prerequisites
- [PostgreSQL](https://www.postgresql.org/) 14
  - Recommend installing via [homebrew](https://brew.sh/): `brew install postgresql@14`
- [Ruby](https://ruby-doc.org/) 3.1.2
  -  Recommend installing via [rbenv](https://github.com/rbenv/rbenv#installation)
- [Bundler](https://bundler.io/) 2.3.11: `gem install bundler`
- [RubyGems](https://rubygems.org/pages/download) 2.5.0 or higher
  - Check your current version: `gem --version`
  - If needed, update version: `gem update --system`

### Running the app locally
- Set your database username as an environment variable if different from `postgres`:
  - Create .env file from .env.example: `cp .env.example .env`
  - Update file to specify your database username, e.g.: `DATABASE_USERNAME=yourusername`
- Install Ruby dependencies: `bundle install`
- Setup database: `bin/rails db:setup`
- Start server: `bin/rails s`
- In a separate terminal window, run Tailwind CSS in watch mode: `bin/rails tailwindcss:watch`
- Visit `localhost:3000` to see the app

### Running tests
TBD

### Tailwind CSS
We are using [Tailwind CSS](https://tailwindcss.com/) for our CSS styles. Check out their [documentation](https://tailwindcss.com/docs/) for more information on how to use it.

### Deployment
This app is hosted on [Heroku](https://www.heroku.com). Merging pull requests to the `master` branch triggers an auto-deploy.

## Wireframe Designs
Wireframe designs can be found in [lib/wireframes](lib/wireframes).

## Contributing
This is an all volunteer-run project, and pull requests are very welcome! Check out our [issues](https://github.com/codeforUV/food_resources/issues) for a list of tasks that need contributions. Join the [Code for UV Slack](https://join.slack.com/t/codeforuv/shared_invite/zt-er1lyzw6-o3YKylqiImsnMaQ_bBnS8w) to ask questions and connect with other volunteers.

### Code of Conduct
This project and related activities are subject to a [Code of Conduct and Anti-Harrassment Policy](https://github.com/codeforUV/code_of_conduct/blob/master/code_of_conduct.md). Please familiarize yourself with it before making contributions.

### Special Thanks
Special thanks to [Tailwind Labs](https://github.com/tailwindlabs) for donating a license of [Tailwind UI](https://tailwindui.com) to this project!
