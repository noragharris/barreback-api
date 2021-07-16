# frozen_string_literal: true

Rails.application.routes.draw do
  resources :barre_classes
  resources :equipment_items
  resources :exercises
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
