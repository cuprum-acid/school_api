class ApplicationController < ActionController::API
  private

  def authenticate_student!
    token = request.headers["Authorization"]&.split(" ")&.last
    head :unauthorized unless token && Student.exists?(auth_token: token)
  end
end
