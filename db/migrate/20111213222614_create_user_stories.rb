class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :name
      t.text :description
      t.integer :status, :default => 0
      t.references :project
      t.timestamps
    end
  end
end
