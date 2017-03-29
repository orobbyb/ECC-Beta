class StaticController < ApplicationController
  skip_before_action :authorize
  def home
  end

  def about
  end
  
  def whycodes
  end

  def contact
  end

  def authoringcode
  end

  def collectionpolicy
  end
end
