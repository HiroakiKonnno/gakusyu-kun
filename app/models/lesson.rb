class Lesson < ApplicationRecord
  has_many :userlessons
  has_many :lessons, :through => :userlessons
end
