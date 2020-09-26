class TrainingModulesController < ApplicationController
  # This controller action should have different name as we expect a bit different behavior from index
  # Having a hard time to come up with a decent name and path
  def index
    training_modules = TrainingModule.join_and_sort_by_category_name

    paginate json: training_modules
  end

  def top10
    training_modules = TopTrainingModulesQuery.new.call

    render json: training_modules
  end
end
