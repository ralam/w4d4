class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :album_type, null: false
      t.string :lyrics
      t.integer :album_id
      t.timestamps null: false
    end

    add_index :tracks, :lyrics
  end
end
