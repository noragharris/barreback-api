# frozen_string_literal: true

class EquipmentItemsController < ApplicationController
  before_action :set_equipment_item, only: %i[show update destroy]

  # GET /equipment_items
  def index
    @equipment_items = EquipmentItem.all
    json_response(@equipment_items)
  end

  # GET /equipment_items/:id
  def show
    json_response(@equipment_item)
  end

  # POST /equipment_items
  def create
    @equipment_item = EquipmentItem.create!(equipment_item_params)
    json_response(@equipment_item, :created)
  end

  # PUT /equipment_items/:id
  def update
    @equipment_item.update(equipment_item_params)
    json_response(@equipment_item)
  end

  # DELETE /equipment_items/:id
  def destroy
    @equipment_item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_equipment_item
    @equipment_item = EquipmentItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def equipment_item_params
    params.permit(:name)
  end
end
