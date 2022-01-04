class Lesson < ApplicationRecord
  has_many :userlessons, dependent: :destroy
  has_many :users, :through => :userlessons
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :userlessons
end
