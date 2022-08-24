class CreateCommits < ActiveRecord::Migration[7.0]
  def change
    create_table :commits do |t|
      t.string :sha
      t.integer :additions
      t.integer :deletions
      t.string :date
      t.integer :project_id
      t.integer :contributor_id

      t.timestamps
    end
  end
end
