class Student < ApplicationRecord
  belongs_to :school
  belongs_to :school_class, foreign_key: "class_id", class_name: "SchoolClass"

  validates :first_name, :last_name, :surname, :class_id, :school_id, presence: true
end
