# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

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
    run "rails s" in console to run the server
    hit the endpoint of "localhost:3000/getProject/:owner/:repo" of the project you want to seed into the DB
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
