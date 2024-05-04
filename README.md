# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### Run app
```shell
cd app-doc-sales/
 ./bin/dev  # run http://localhost:3000/
 
```

```shell
EDITOR=VIM bundle exec rails credentials:edit # or
EDITOR=nano bundle exec rails credentials:edit
```

```shell
# edit
#uncomment and add your credentials
aws:
   access_key_id: 123
   secret_access_key: 345

#uncomment and add your credentials 
#config/storage.yml
amazon:
  service: S3
  access_key_id: <%= Rails.application.credentials.dig(:aws, :access_key_id) %>
  secret_access_key: <%= Rails.application.credentials.dig(:aws, :secret_access_key) %>
  bucket: "bucket_name_here"
  region: "your_region_here"

  ```