class ProjectsController < ApplicationController
    def getProject
        #Get project data
        projResp = HTTParty.get("https://api.github.com/repos/#{params[:owner]}/#{params[:repo]}")
        #using find or create by to notstore duplicates of the same project
        proj = Project.find_or_create_by(name: projResp["name"])

        #Get Project commits which also store the last users with those commits
        commitsResp = HTTParty.get("https://api.github.com/repos/#{params[:owner]}/#{params[:repo]}/commits?per_page=10")
        
        #Loop through each commit to get sha to use as an endpoint to get access to nested data inside a single commit (additions/deletions/username)
        commitsResp.each {|commit|
            commitResp = HTTParty.get("https://api.github.com/repos/#{params[:owner]}/#{params[:repo]}/commits/#{commit["sha"]}")
            user = Contributor.find_or_create_by(username: commitResp["author"]["login"])
            user.commits.create(
                sha: commitResp["sha"], 
                additions: commitResp["stats"]["additions"], 
                deletions: commitResp["stats"]["deletions"],
                date: commitResp["commit"]["commiter"]["date"],
                project: proj
            )
        }
        render json: proj
    end

    def index
        projects = Project.all
        render json: projects
    end

    def show
        project = Project.find(params[:id])
        render json: project
    end
end
