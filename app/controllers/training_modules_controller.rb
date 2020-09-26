class TrainingModulesController < ApplicationController
  def index
    @training_modules = TrainingModule.all

    render json: @training_modules
  end
end
