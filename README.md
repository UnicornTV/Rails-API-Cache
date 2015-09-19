# Rails CMS and API Cache

This is a very simple demo CMS and API. It leverages Rails, MongoDB and Amazon S3.
You can find a demo app [on heroku](https://rails-api-cache.herokuapp.com).

## Featuring
* Rails 4
* Mongoid as database
* Amazon S3 for images and API cache
* Devise for user management and authentication
* CanCan for user access control
* Haml for default views
* Simple Form for forms
* Manticore UI for CSS styling with default scripts and form helpers

## Installation
- Clone this repo
- Edit `db/seed.rb` to customize admin user settings then run `rake db:seed` to create admin user
- Edit `config/initializers/devise.rb` to customize your omniauth providers (set env vars or disable, etc)
- Edit `config/config.yml` to customize your application settings, they will be available via `Manticore::Config` object within your app, e.g. `Manticore::Config.default_role`
- Run with `rails s` and browse at `http://localhost:3000`

## Simple Form
By default, your form fields will be wrapped using simple form, however there are a few custom wrappers you can use as well:

---
### Links

* [Devise](http://github.com/plataformatec/devise)
* [OmniAuth](https://github.com/intridea/omniauth)
* [CanCan](https://github.com/ryanb/cancan)