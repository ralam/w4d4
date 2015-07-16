class Album < ActiveRecord::Base

  validates :name, :band_id, presence: true
  validates :band_id, uniqueness: true

end
