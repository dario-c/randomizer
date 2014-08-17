class City < ActiveRecord::Base
  has_many :tipps
  validates :name, presence: true
end
