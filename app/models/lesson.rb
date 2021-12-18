class Lesson < ApplicationRecord
  has_many :userlessons
  has_many :lessons, :through => :userlessons
  has_many :tasks
end
