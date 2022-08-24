class Contributor < ApplicationRecord
    has_many :commits
    has_many :projects, through: :commits
end
