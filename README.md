# BJJ Hive

## Table of Contents
* About
    * Resources
* Getting started
    * Installation
    * Usage
* Contributing
    * Code Style
    * Testing
* TODO

## About
This project is a platform for BJJ practitioners to view industry events in a filterable event listing.

### Resources
#### Environments
[Develop Environment](https://bjj-hive-dev.herokuapp.com/)

[Staging Environment](https://bjj-hive-staging.herokuapp.com/)

[Production Environment](https://bjj-hive-prod.herokuapp.com/)

#### Other Links
[Heroku](https://heroku.com)

[LogDNA](https://app.logdna.com/649af71be9/logs/view)

[LocationIQ](https://locationiq.com/)

## Getting Started
### Installation
To install, first ensure that you have `docker` and `docker-compose` installed and running, then clone the repo:

```
git clone git@gitlab.com:d3d1rty/bjj-hive.git
cd bjj-hive
```

Create the local `.env` file and specify any sensitive credentials or other environment variables.

```
echo "LOCATION_IQ_TOKEN=[INSERT TOKEN HERE]" > .env
```

Recommendation: set up `bash` aliases and functions for `docker-compose` to shorten some of the commonly used commands.
Add the following to your `.bashrc` configuration to enable use of `dew` instead of `docker-compose exec web` and `dup`
instead of `docker-compose up`.
```
dew() {
    docker-compose exec web $@
}

alias dup='docker-compose up'
```

Build the containers.
```
docker-compose build
```

Create the database and run the migrations.

```
docker-compose exec web bundle exec rails db:create
docker-compose exec web bundle exec rails db:migrate
```

Start the server.
```
docker-compose up
```

### Deployment
To deploy, you will need the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install) utility
installed as well as access to the app instances.

Set up the git remotes for each app instance.
```
heroku git:remote -a bjj-tracker-dev
git remote rename heroku heroku-dev
heroku git:remote -a bjj-tracker-staging
git remote rename heroku heroku-staging
```

The `heroku-dev` remote should be used when pushing up changes on a feature branch to test in a deployed environment prior
to merging that feature branch into `master`. You can do this by overwriting the `master` branch on the `heroku-dev` remote
(replace `feature-branch` with the name of your actual feature branch).
```
git push heroku-dev feature-branch:master
```

After merging a feature branch into `master`, you can deploy the changes to the staging environment of the production pipeline
for acceptance testing. Changes should be promoted to production via the pipeline functionality within the Heroku web interface
after acceptance testing has passed.
```
git push heroku-staging master
```

### Usage
Usage instructions will be published as features are rolled out.

## Contributing
### Code Style
For ruby, we use Rubocop to enforce code style and Reek to find code smells.
To manually run `rubocop`, you can run the following commands:

```
# Run rubocop for the entire project
docker-compose exec web bundle exec rubocop
# Run rubocop for a specific file
docker-compose exec web bundle exec rubocop foo/bar.rb
```

To manually run `reek`, you can execute:
```
docker-compose exec web bundle exec reek
```

For Javascript, we use ESLint with the Standard rules. To run the linter, execute:
```
eslint app/assets/javascripts
```

For stylesheets, we use Stylelint. To run the linter, execute:
```
stylelint app/assets/stylesheets
```

### Testing
The test suite is executed on every commit to GitLab, and it can be run manually on your local machine:
```
docker-compose exec web bundle exec rspec
```

## TODO
* Everything.
