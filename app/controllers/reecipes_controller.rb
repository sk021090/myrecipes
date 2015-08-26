class ReecipesController < ApplicationController
  def index
    @reecipes = Reecipe.all
  end
end
