# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_type :string           not null
#  lyrics     :string
#  album_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base

  validates :name, :band_id, presence: true
  belongs_to :album

end
