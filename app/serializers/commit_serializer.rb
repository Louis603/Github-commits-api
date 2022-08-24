class CommitSerializer < ActiveModel::Serializer
  attributes :id, :sha, :additions, :deletions, :date
end
