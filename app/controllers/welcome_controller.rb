class WelcomeController < ApplicationController
  def index
    redirect_to current_user if current_user
  end

  def about
  end
end
