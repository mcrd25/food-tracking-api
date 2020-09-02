class MealEntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]
  before_action authenticate_current_user

  # GET /meal_entries
  def index
    @entries = user_signed_in? # current_user.meal_entries
    json_response(@entries)

  end

  # POST /meal_entries
  def create
    @entry = MealType.create!(meal_entry_params.merge(user_id: current_user.id))
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
