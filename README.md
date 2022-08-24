# README
To be totally honest I spent way more than 4 hours on this. As I ran into small problems here and there.And accessing the github api alone was a learning curve for me. Not sure if scraping data first would have been the best way but I really learned a lot from this take home. I've never fetched data in this way as I'm used to sending data from the frontend to the back or just using an api on its own. This has really taught me I have a lot to learn. Thank you!

https://serene-badlands-76492.herokuapp.com/
the rails project has already been scraped first as a test after a database reset

* How to run the test suite
    1. bundle install
    2. run "rails db:migrate" to establish the three models
    3. run "rails s" in console to run the server
    4. The app needs to manually fetch from github first in order to see the data
    hit the endpoint example "http://localhost:3000/getProject?owner=rails&repo=rails"  of the project you want to seed into the DB
    - **owner = "owner name" repo = "repo name"**
    5. running db endpoints
        - "/projects" show all of the projects and id
        - "/projects/{projectID}" shows individual project with contributions and contributors
        - "/projects/{projectID}/{contributorID}" shows user, total commits, what theyve worked on recently and their commits

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

    

* # Database creation
    3 models 
    project
    contributor
    commit (join table for many to many)

