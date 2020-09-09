# Food Tracking API

> A simple food tracking API written in Rails and using JWT Authentication

This API allows for a user to be created and makes calls to store meal entries if they are logged in so that they can keep track all their meals.
The API is also extensively tested with basic unit tests and each request meant to be used by end user tested

## Built With

- Rails 6.0.3.2,
- Ruby 2.7.1
- RSpec 3.9

## Live Demo

[Live Demo Link](https://food-tracking-api.herokuapp.com/)

## Docs
- [API ENDPOINTS](docs/API_Endpoints.pdf)
- [ERD DIAGRAM](docs/foodtracker.png)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites
You will need to have a recent version of [Ruby](https://www.ruby-lang.org/en/) and [Rails](https://rubyonrails.org/)

### Setup
run `git clone https://github.com/mcrd25/food-tracking-api.git` <br>
run `cd food-tracking-api`

### Install
run `bundle install`
you may have to run `yarn install --check-files`

run `rails db:migrate` or run `rails db:setup`
run `rails db:seed` if `rails db:setup` was not run

### Usage
run `rspec` or `bundle exec rspec` to run tests <br>
run `rails s` or `rails server` to run on development server

### Deployment
App deployed on heroku.
Instructions
- Install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
- Login: `heroku login`
- Create heroku app `heroku create`
- Push to heroku master `git push heroku master` if you experience issues try `git push heroku +HEAD:master`
- Migrate DB: `heroku run rails db:migrate`
- Run seed files: `heroku run rails db:seed`
- Open link: `heroku open`


## Authors

👤 **Maya Douglas (mcrd25)**

- Github: [@mcrd25](https://github.com/mcrd25)
- Twitter: [@mcrd25](https://twitter.com/mcrd25)
- Linkedin: [linkedin](https://linkedin.com/in/mayadouglas)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- The authentication was heavily influenced by this [tutorial](https://scotch.io/tutorials.build-a-restful-json-api-with-rails-5-part-two)

## 📝 License

This project is [MIT](LICENSE) licensed.