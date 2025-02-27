class School < ApplicationRecord
  has_many :classes, class_name: "SchoolClass"
  has_many :students
end
