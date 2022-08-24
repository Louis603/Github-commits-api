class ProjectsController < ApplicationController
    def getProject
        #    example http://localhost:3000/getProject?owner=rails&repo=rails
        # Had to switch to using params this way because nodejs.org plugged into the repo params would show up as nodejs when the repo name actually ends with an .org
        owner = params[:owner]
        repo = params[:repo]

        # hitting github api limits so had to include token into header for quick fix
        headers = {
            "Authorization" => "Bearer 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"
          }
        
          #Get project data
        projResp = HTTParty.get("https://api.github.com/repos/#{owner}/#{repo}",
            :headers => headers
        )
        #using find or create by to notstore duplicates of the same project
        proj = Project.find_or_create_by(name: projResp["name"])


        #Get Project commits which also store the last users with those commits
        commitsResp = HTTParty.get("https://api.github.com/repos/#{owner}/#{repo}/commits?per_page=100",
            :headers => headers
        )
        
        #Loop through each commit to get sha to use as an endpoint to get access to nested data inside a single commit (additions/deletions/username)
        commitsResp.each {|commit|
            commitResp = HTTParty.get("https://api.github.com/repos/#{owner}/#{repo}/commits/#{commit["sha"]}",
                :headers => headers
            )
            user = Contributor.find_or_create_by(username: commitResp["author"]["login"])
            user.commits.create(
                sha: commitResp["sha"], 
                additions: commitResp["stats"]["additions"], 
                deletions: commitResp["stats"]["deletions"],
                date: commitResp["commit"]["committer"]["date"],
                project: proj
            )
        }
        render json: proj
    end

    
    def index
        projects = Project.all.pluck(:id, :name)
        # render json: projects, serializer: OnlyProjectsSerializer
        render json: projects
    end

    def show
        project = Project.find(params[:id])
        render json: project
    end

    def showUser
        contributor = Project.find(params[:proj]).contributors.find(params[:user])
        render json: contributor
    end
end
