class TrainingModulesController < ApplicationController
  # before_action :set_training_module, only: [:show, :update, :destroy]

  # # GET /training_modules
  # def index
  #   @training_modules = TrainingModule.all

  #   render json: @training_modules
  # end

  # # GET /training_modules/1
  # def show
  #   render json: @training_module
  # end

  # # POST /training_modules
  # def create
  #   @training_module = TrainingModule.new(training_module_params)

  #   if @training_module.save
  #     render json: @training_module, status: :created, location: @training_module
  #   else
  #     render json: @training_module.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /training_modules/1
  # def update
  #   if @training_module.update(training_module_params)
  #     render json: @training_module
  #   else
  #     render json: @training_module.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /training_modules/1
  # def destroy
  #   @training_module.destroy
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_training_module
  #     @training_module = TrainingModule.find(params[:id])
  #   end

  #   # Only allow a trusted parameter "white list" through.
  #   def training_module_params
  #     params.require(:training_module).permit(:name, :description, :difficulty, :type)
  #   end
end
