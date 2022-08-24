# README


* How to run the test suite
    1) bundle install
    2) run "rails db:migrate" to establish the three models
    3) run "rails s" in console to run the server
    4) The app needs to manually fetch from githuub first in order to see the data
    # hit the endpoint "example http://localhost:3000/getProject?owner=rails&repo=rails"  of the project you want to seed into the DB
    owner = "owner name"
    repo = "repo name"
    5) running db endpoints
        "/projects" show all of the projects and id
        "/projects/{projectID}" shows individual project with contributions and contributors
        "projects/{projectID}/{contributorID}" shows user, total commits, what theyve worked on recently and their commits

* Ruby version
    2.7.6
* System dependencies
    # gems used for this app. make sure to run bundle install
    gem 'httparty'
    
    gem "active_model_serializers", "~> 0.10.13"
    
    group :development, :test do
        <!-- # Call 'byebug' anywhere in the code to stop execution and get a debugger console -->
        gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    end

    
* Configuration

* Database creation
    # 3 models 
    project
    contributor
    commit (join table for many to many)

* Database initialization
    rails db:migrate
* How to run the test suite
    run "rails db:migrate" to establish the three models
    run "rails s" in console to run the server
    # hit the endpoint "example http://localhost:3000/getProject?owner=rails&repo=rails"  of the project you want to seed into the DB
    owner = "owner name"
    repo = "repo name"
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
