class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.integer :length
      t.boolean :finished
      t.references :release_plan
      t.timestamps
    end
    add_index :iterations, :release_plan_id
  end
end
