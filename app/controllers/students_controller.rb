class StudentsController < ApplicationController
  before_action :authenticate_student!, only: [ :destroy ]

  def create
    student = Student.new(student_params)
    student.auth_token = generate_auth_token(student)

    if student.save
      render json: student, status: :created,
             headers: { 'X-Auth-Token': student.auth_token }
    else
      render json: { errors: student.errors }, status: :method_not_allowed
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    head :bad_request
  end

  def index
    students = Student.where(school_id: params[:school_id], class_id: params[:class_id])
    render json: { data: students }
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
  end

  def generate_auth_token(student)
    require "digest"
    secret_salt = Rails.application.credentials.secret_key_base || Rails.application.secret_key_base
    Digest::SHA256.hexdigest("#{student.id}#{secret_salt}")
  end
end
