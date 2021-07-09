# frozen_string_literal: true

module ClassType
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    enum class_type: {
      Classic: 1,
      Empower: 2,
      Reform: 3
    }
    validates :class_type, inclusion: { in: class_types }
  end
end
