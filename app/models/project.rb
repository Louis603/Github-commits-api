class Project < ApplicationRecord
    has_many :commits
    has_many :contributors, through: :commits
end
