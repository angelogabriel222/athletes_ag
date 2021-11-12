# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    2.7.2

* System dependencies
     postgresql >= 12

* Configuration

* Install the bundle
```
bundle install
```

* Database creation
```sh
rails db:create
```

* Database initialization

Make sure the PostgreSQL is running on localhost. You may have to change your credentials under `/config/secret.yml`

```sh
rake db:create
rake db:migrate
rake db:seed
```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
