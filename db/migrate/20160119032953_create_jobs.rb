class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :containers_needed
      t.string :cargo
      t.decimal :cost
      t.string :origin
      t.string :destination
      t.references :boat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
