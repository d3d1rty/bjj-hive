# BJJ Tracker

## Table of Contents
* About
* Getting started
    * Installation
    * Usage
* Contributing
    * Code Style
    * Testing
* TODO

## About
This project is a platform for BJJ practitioners to view industry events in a filterable event listing.

[Staging Environment](https://bjj-tracker-staging.herokuapp.com/)
[Production Environment](https://bjj-tracker-prod.herokuapp.com/)

## Getting Started
### Installation
To install, fork the repo and execute:

```
git clone git@gitlab.com:d3d1rty/bjj-tracker.git
cd bjj-tracker
bundle
yarn install
docker-compose build
```

Then, create the `.env` file and enable user signup.

```
ALLOW_SIGNUP=true
```

Start the server.
```
docker-compose up -d
```

Create the database and run the migrations.

```
docker-compose run web bundle exec rails db:create
docker-compose run web bundle exec rails db:migrate
```

To signup, navigate to `http://localhost:3000/sign_up`


### Usage
Usage instructions will be published as features are rolled out.

## Contributing
### Code Style
For ruby, we use Rubocop to enforce code style and Reek to find code smells.
To manually run `rubocop`, you can run the following commands:

```
# Run rubocop for the entire project
bundle exec rubocop
# Run rubocop for a specific file
bundle exec rubocop foo/bar.rb
```

To manually run `reek`, you can execute:
```
bundle exec reek
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
docker-compose run web bundle exec rspec
```

## TODO
* Everything.
