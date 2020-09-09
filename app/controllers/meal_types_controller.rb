class MealTypesController < ApplicationController
  before_action :set_meal_type, only: %i[show update destroy]

  # GET /meal_types
  def index
    @meal_types = MealType.all
    json_response(@meal_types)
  end

  # POST /meal_types
  def create
    @meal_type = MealType.create!(meal_type_params)
    json_response(@meal_type, :created)
  end

  # GET /meal_types/:id
  def show
    json_response(@meal_type)
  end

  # PUT /meal_types/:id
  def update
    @meal_type.update(meal_type_params)
    head :no_content
  end

  # DELETE /meal_types/:id
  def destroy
    @meal_type.destroy
    head :no_content
  end

  private

  def meal_type_params
    params.permit(:name, :description)
  end

  def set_meal_type
    @meal_type = MealType.find_by(id: params[:id])
  end
end
