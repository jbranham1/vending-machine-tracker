class Snack < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

end
