class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :authenticate_user!

  def index
    render text: File.open("#{Rails.root}/public/index.html").read
  end

  def forgery_protection
    render json: {error: 'had an issue'}, status: 501
  end
end
