class CreateReleasePlans < ActiveRecord::Migration
  def change
    create_table :release_plans do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :finished
      t.references :project
      t.timestamps
    end
    add_index :release_plans, :project_id
  end
end
