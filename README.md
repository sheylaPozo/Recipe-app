# Recipe App

![Microverse](https://img.shields.io/badge/Microverse-blueviolet)

> The Recipe app keeps track of all your recipes, ingredients, and inventory

![screenshot](https://user-images.githubusercontent.com/54015740/143592111-fb31f0f8-bb71-414e-afd0-b30eebb2d221.png)

The Recipe app keeps track of all your recipes, ingredients, and inventory. It will allow you to save ingredients, keep track of what you have, create recipes, and generate a shopping list based on what you have and what you are missing from a recipe. Also, since sharing recipes is an important part of cooking the app should allow you to make them public so anyone can access them.

## Built With

- Ruby on Rails
- PostgreSQL
- CSS

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://gorails.com/)

### Setup

- Make sure you have Ruby on Rails set up properly on your computer
- Clone or download this repo on your machine
- Enter project directory

### Install

```sh
bundle install
```

### Database

```sh
# Create user
sudo -u postgres createuser recipe_app -s

# Create the database
rails db:create

## Apply migration
rails db:migrate

# Load the schema
rails db:schema:load
```

### Run

```sh
rails s
```

### Test

```sh
rspec
```

### Troubleshoot

```sh
### Rspec failing
RAILS_ENV=test rake db:reset
```

```sh
### New Scaffold
rails g scaffold_controller model
```

```sh
### Undo migration
rake db:migrate VERSION=0
```

## Authors

👤 **Arturo Ortega**

- GitHub: [@eroiyo](https://github.com/eroiyo)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/carlos-arturo-ortega-guanipa/)

👤 **Sheyla Pozo**

- Github:[sheylaPozo](https://github.com/sheylaPozo)
- Linkedin: [Sheyla Pozo](https://www.linkedin.com/in/sheypozo/)

👤 **Caleb Moses**

- Github: [@m05e5](https://github.com/m05e5)
- Linkedin: [caleb Moses](https://www.linkedin.com/in/caleb-moses-0a1b531b9/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/eroiyo/Recipe-app/issues)

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

