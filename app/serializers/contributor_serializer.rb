class ContributorSerializer < ActiveModel::Serializer
  attributes :id, :username, :total_commits

  has_many :commits

  def total_commits
    self.object.commits.size
  end
end
