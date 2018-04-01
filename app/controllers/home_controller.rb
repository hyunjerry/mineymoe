class HomeController < ApplicationController
  def show
    if current_user
      redirect_to '/post'
    end
  end
end
