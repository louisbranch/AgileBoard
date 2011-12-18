class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :name
      t.text :description
      t.references :project
      t.references :release_plan
      t.references :iteration
      t.references :status
      t.references :story_point
      t.references :priority
      t.timestamps
    end
    add_index :user_stories, :project_id
    add_index :user_stories, :release_plan_id
    add_index :user_stories, :iteration_id
    add_index :user_stories, :status_id
    add_index :user_stories, :story_point_id
    add_index :user_stories, :priority_id
  end
end
