class Machine < ApplicationRecord
  validates_presence_of :location
  validates_uniqueness_of :location
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks
  belongs_to :owner

end
