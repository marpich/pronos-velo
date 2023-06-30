class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @race = Race.first
    @stage = Stage.where(date: Date.current).first
    @date = "#{@stage.date.strftime('%b')} #{@stage.date.strftime('%d')}, #{@stage.date.strftime('%Y')}" if @stage
    @rest_day = Stage.where(date: Date.current + 1).first
  end

  def rules
  end

  def faq
  end

  def manifest
  end

end
