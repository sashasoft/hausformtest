class Element < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :label, presence: true
end
