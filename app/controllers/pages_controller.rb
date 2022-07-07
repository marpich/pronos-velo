class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def info
  end

  def profile
  end

  def my_results
  end

  def rules
  end

  def about
  end

end
