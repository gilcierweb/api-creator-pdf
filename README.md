# Api generate PDF

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

### Skill

- [Ruby](https://www.ruby-lang.org/pt/)
- [Ruby on Rails](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [Esbuild](https://esbuild.github.io/)

### Run app
```shell
cd app-doc-sales/
 ./bin/dev  # run http://localhost:3000/
 
```

The API shall have two endpoints:

- GET /api/v1/documents/list
- POST/PUT /api/v1/documents/create
- PATCH/PUT    /api/v1/documents/:id
- GET / 

#### GET /api/v1/documents/list

```json

// Example response of the GET /api/v1/documents/list request
[
  {
    "uuid": "2b2ab03a-8b81-47c1-9af3-3b3c8d695f71",
    "pdf_url": "presigned_url or local file path",
    "description": "Example description 1",
    "document_data": { // arbitrary data coming from the user
      "customer_name": "Tomás",
      "contract_value": "R$ 1.990,90",
      // ...
    },
    "created_at": "2012-04-23T18:25:43.511Z"
  },
    {
    "uuid": "d3b75481-3f8e-4a23-9c2e-738abf8e998b",
    "pdf_url": "presigned_url or local file path",
    "description": "Example description 2",
    "document_data": { // arbitrary data coming from the user
      "customer_name": "Haroldo",
      "contract_value": "R$ 10.990,90",
      // ...
    },
    "created_at": "2012-04-23T18:25:43.511Z"
  },
  // ...
]
```

#### POST/PUT /api/v1/documents/create Request
```json
// Example request to the POST/PUT /api/v1/documents/create endpoint
{
  "description": "Example description 2",
  "document_data": { // arbitrary data coming from the user
    "customer_name": "Haroldo",
    "contract_value": "R$ 10.990,90",
    // ...
  },
  "template": "HTML Fragment template goes here, for brevity it is shown on template.html file"
}
```

#### POST/PUT /api/v1/documents/create Reponse

```json
// Example response of the POST/PUT /api/v1/documents/create endpoint
{
  "uuid": "10a32fae-1c61-4b2f-b5c7-4de80f4d6f1d",
  "pdf_url": "presigned_url or local file path",
  "description": "Example description 2",
  "document_data": { // arbitrary data coming from the user
    "customer_name": "Haroldo",
    "contract_value": "R$ 10.990,90"
  },
  "created_at": "2012-04-23T18:25:43.511Z"
}
```

```shell
EDITOR=VIM bundle exec rails credentials:edit # or
EDITOR=nano bundle exec rails credentials:edit
```

```text
# edit
# Case AWS S3
# EDITOR=nano bundle exec rails credentials:edit
#uncomment and add your credentials 
aws:
   access_key_id: 123
   secret_access_key: 345

# in config/environments/production.rb
config.active_storage.service = :amazon 

#uncomment and add your credentials 
#config/storage.yml
amazon:
  service: S3
  access_key_id: <%= Rails.application.credentials.dig(:aws, :access_key_id) %>
  secret_access_key: <%= Rails.application.credentials.dig(:aws, :secret_access_key) %>
  bucket: "bucket_name_here"
  region: "your_region_here"

# Case Azure Storage
# In Gemfile #uncomment and run bundle install
# gem 'azure-storage-blob', require: false # if storage in azure

# in config/environments/production.rb
config.active_storage.service = :azure 

# EDITOR=nano bundle exec rails credentials:edit
#uncomment and add your credentials 
azure_storage:
   storage_access_key: 123
 
#uncomment and add your credentials 
#config/storage.yml
# Use bin/rails credentials:edit to set the Azure Storage secret (as azure_storage:storage_access_key)
# microsoft:
#   service: AzureStorage
#   storage_account_name: your_account_name
#   storage_access_key: <%= Rails.application.credentials.dig(:azure_storage, :storage_access_key) %>
#   container: your_container_name-<%= Rails.env %>
  
# Case Azure Storage
# In Gemfile #uncomment and run bundle install
# gem 'google-cloud-storage', "~> 1.11", require: false # if storage in google

# in config/environments/production.rb
config.active_storage.service = :google 
 
#uncomment and add your credentials 
#config/storage.yml
# Remember not to checkin your GCS keyfile to a repository
# google:
#   service: GCS
#   project: your_project
#   credentials: <%= Rails.root.join("path/to/gcs.keyfile") %>
#   bucket: your_own_bucket-<%= Rails.env %>

  ```

### Docker and Docker Compose

```shell

docker-compose build
docker-compose up # run http://localhost:3000

docker-compose up --build # run http://localhost:3000

# Optional
docker-compose ps
docker-compose stop
docker-compose down
docker-compose run --rm app bash
docker network create rustnet

# sudo docker rmi --force $(docker images -f "dangling=true" -q)

```

https://gilcierweb.com.br