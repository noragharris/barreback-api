module Quarter
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    enum quarter: {
      Q1: 1,
      Q2: 2,
      Q3: 3,
      Q4: 4
    }
    validates :quarter, inclusion: { in: quarters }
  end
end
