class Machine < ApplicationRecord
  validates_presence_of :location
  validates_uniqueness_of :location
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks
  belongs_to :owner

  def average_price_of_snacks
    avg = snacks.average(:price)
    if avg
      "$" + sprintf("%.2f", avg)
    else
      "$0.00"
    end
  end

  def count_of_unique_snacks
    snacks.group(:name).pluck(:name).count
  end
end
