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

## Environment Variables

The CMS leverages Twitter API and Amazon S3 for caching the API as well as image uploads. Make sure to set the following environment variables:

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- S3_BUCKET
- S3_HOST_ALIAS
- TWITTER_ACCESS_TOKEN
- TWITTER_ACCESS_TOKEN_SECRET
- TWITTER_CONSUMER_KEY
- TWITTER_CONSUMER_SECRET
- MONGO_URL
- DEVISE_SECRET_KEY
- SECRET_KEY_BASE

### Amazon S3 Policy

You will likely want to generate a user that has access to the S3 bucket. The most secure way to do this is to create an inline policy and explicitly allow permissions as needed:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::YOUR_BUCKET_NAME",
                "arn:aws:s3:::YOUR_BUCKET_NAME/*"
            ]
        }
    ]
}
```

---
### Links

* [Devise](http://github.com/plataformatec/devise)
* [OmniAuth](https://github.com/intridea/omniauth)
* [CanCan](https://github.com/ryanb/cancan)