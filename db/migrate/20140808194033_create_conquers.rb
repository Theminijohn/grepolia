class CreateConquers < ActiveRecord::Migration
  def change
    create_table :conquers, id: false do |t|
      t.primary_key :town_id
      t.integer :time
      t.integer :new_player_id
      t.integer :old_player_id
      t.integer :new_ally_id
      t.integer :old_ally_id
      t.integer :town_points
      t.boolean :intern, default: false
      t.string :old_player_name
      t.string :old_alliance_name

      t.timestamps
    end
    add_index :conquers, :town_id
    add_index :conquers, :new_player_id
    add_index :conquers, :old_player_id
    add_index :conquers, :new_ally_id
    add_index :conquers, :old_ally_id
    add_index :conquers, :town_points
    add_index :conquers, :intern
  end
end
