# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    redirect_to '/categories' if user_signed_in?
  end
end
