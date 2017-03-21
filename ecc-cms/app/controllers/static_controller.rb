class StaticController < ApplicationController
  skip_before_action :authorize
  def home
  end

  def about
  end
end
