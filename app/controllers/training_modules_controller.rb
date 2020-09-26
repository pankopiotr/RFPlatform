class TrainingModulesController < ApplicationController
  def index
    @training_modules = TrainingModule.all

    paginate json: @training_modules
  end
end
