class SchoolClassesController < ApplicationController
  def index
    classes = SchoolClass.where(school_id: params[:school_id])
    render json: {
      data: classes.map { |c|
        {
          id: c.id,
          number: c.number,
          letter: c.letter,
          students_count: c.students_count
        }
      }
    }
  end
end
