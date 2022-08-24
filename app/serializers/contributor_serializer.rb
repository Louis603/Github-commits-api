class ContributorSerializer < ActiveModel::Serializer
  attributes :id, :username, :total_commits, :recently_worked_on

  has_many :commits

  def total_commits
    self.object.commits.size
  end

  def recently_worked_on
    self.object.projects.uniq.pluck(:name)
  end

end
