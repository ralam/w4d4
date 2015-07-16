# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  album_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base

  validates :name, :band_id, presence: true
  validates :album_type, inclusion: %w(live studio)

  has_many :tracks, dependent: :destroy
  belongs_to :band

end
