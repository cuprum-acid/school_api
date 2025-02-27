class SchoolClass < ApplicationRecord
  belongs_to :school
  has_many :students, foreign_key: "class_id"

  def students_count
    students.count
  end
end
