class MealEntriesController < ApplicationController
  before_action :set_entry, only: %i[show update destroy]

  # GET /meal_entries
  def index
    @entries = MealEntry.all
    json_response(@entries)
  end

  # POST /meal_entries
  def create
    @entry = MealType.create!(meal_entry_params.merge(user_id: 1))
    json_response(@entry, :created)
  end

  # GET /meal_entries/:id
  def show
    json_response(@entry)
  end

  # PUT /meal_entries/:id
  def update
    @entry.update(meal_entry_params)
    head :no_content
  end

  # DELETE /meal_entries/:id
  def destroy
    @entry.destroy
    head :no_content
  end

  private

  def meal_entry_params
    params.permit(:meal_typ_id, :name, :description, calories)
  end

  def set_entry
    @entry = MealEntry.find_by(id: params[:id])
  end
end
