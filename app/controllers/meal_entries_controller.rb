class MealEntriesController < ApplicationController
  before_action :set_entry, only: %i[show update destroy]

  # GET /meal_entries
  def index
    @entries = current_user.meal_entries
    json_response(@entries)
  end

  # POST /meal_entries
  def create
    @entry = current_user.meal_entries.create!(meal_entry_params)
    json_response(@entry, :created)
  end

  # GET /meal_entries/:id
  def show
    json_response(@entry)
  end

  # PUT /meal_entries/:id
  def update
    if @entry
      @entry.update(meal_entry_params)
      json_response(@entry)
    else
      json_response({ message: 'Entry not found' }, :not_found)
    end
  end

  # DELETE /meal_entries/:id
  def destroy
    if @entry
      @entry.destroy
      head :no_content
    else
      json_response({ message: 'Entry not found' }, :not_found)
    end
  end

  private

  def meal_entry_params
    params.permit(:meal_type_id, :name, :description, :calories)
  end

  def set_entry
    @entry = MealEntry.find_by(id: params[:id])
  end
end
