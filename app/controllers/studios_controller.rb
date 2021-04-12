class StudiosController < ApplicationController
  def show
    @studios = Studio.all
  end
end