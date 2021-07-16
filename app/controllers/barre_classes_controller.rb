class BarreClassesController < ApplicationController
  before_action :set_barre_class, only: %i[show update destroy]

  # GET /barre_classes
  def index
    @barre_classes = BarreClass.all
    render json: @barre_classes, include: [exercises: { include: [:equipment_items] }]
  end

  # GET /barre_classes/:id
  def show
    render json: @barre_class, include: [exercises: { include: [:equipment_items] }]
  end

  # POST /barre_classes
  def create
    @barre_class = BarreClass.create!(barre_class_params)
    render json: @barre_class, include: [exercises: { include: [:equipment_items] }], status: :created
  end

  # PUT /barre_classes/:id
  def update
    @barre_class.update(barre_class_params)
    render json: @barre_class, include: [exercises: { include: [:equipment_items] }]
  end

  # DELETE /barre_classes/:id
  def destroy
    @barre_class.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_barre_class
    @barre_class = BarreClass.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def barre_class_params
    params.permit(
      :location,
      :class_type,
      exercise_ids: []
    )
  end
end
