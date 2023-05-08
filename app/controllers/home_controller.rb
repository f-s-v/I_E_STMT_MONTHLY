class HomeController < ApplicationController
  def index
    redirect_to statement_lines_path if user_signed_in?
  end
end
