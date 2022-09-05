class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @stage = Stage.where(date: Date.current).first
    @date = "#{@stage.date.strftime('%b')} #{@stage.date.strftime('%d')}, #{@stage.date.strftime('%Y')}"
  end

  def rules
  end
end
