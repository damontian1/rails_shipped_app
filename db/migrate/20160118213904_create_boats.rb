class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :max_containers
      t.string :current_location
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
