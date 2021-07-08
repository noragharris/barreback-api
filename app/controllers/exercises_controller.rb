class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[show update destroy]

  # GET /exercises
  def index
    @exercises = Exercise.all
    json_response(@exercises)
  end

  # GET /exercises/:id
  def show
    json_response(@exercise)
  end

  # POST /exercises
  def create
    @exercise = Exercise.create!(exercise_params)
    json_response(@exercise, :created)
  end

  # PUT /exercises/:id
  def update
    @exercise.update(exercise_params)
    json_response(@exercise)
  end

  # DELETE /exercises/:id
  def destroy
    @exercise.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def exercise_params
    params.permit(
      :name,
      :quarter,
      :year,
      :class_type,
      :rotation,
      :section,
      :location,
      :direction,
      :height,
      :pull_off,
      :two_sided,
      :active,
      equipment_item_ids: []
    )
  end
end
