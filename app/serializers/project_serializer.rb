class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :contributions, :contributors

  #making sure of no duplicate users as project.contributors is from all commits
  #without uniq it was showing repeats of users related to commits if the had several commits
  def contributors
    self.object.contributors.uniq
  end

  def contributions
    {
      additions: self.object.commits.pluck(:additions).sum,
      deletions: self.object.commits.pluck(:deletions).sum
    }
  end

end
