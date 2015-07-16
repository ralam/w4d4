# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ActiveRecord::Base

  validates :name, presence: true

  has_many :albums, dependent: :destroy

  def create
  end

  def new
  end

  def destroy
  end

  def show
    render :show
  end

  def edit
  end

  def updated
  end

  def index
    render :index
  end

end
