# frozen_string_literal: true

shared_examples_for 'class_type' do
  let(:model) { described_class }
  it {
    should define_enum_for(:class_type).with_values(model.class_types)
  }
  it do
    model.class_types.flatten.each do |ct|
      should allow_value(ct).for(:class_type)
    end
  end
end
