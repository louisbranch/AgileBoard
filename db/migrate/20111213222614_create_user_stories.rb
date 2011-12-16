class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :name
      t.text :description
      t.references :project
      t.references :iteration
      t.references :status
      t.references :story_point
      t.references :priority
      t.timestamps
    end
  end
end
