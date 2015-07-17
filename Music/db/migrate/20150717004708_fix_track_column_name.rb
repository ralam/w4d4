class FixTrackColumnName < ActiveRecord::Migration
  def change
    rename_column :tracks, :album_type, :track_type
  end
end
