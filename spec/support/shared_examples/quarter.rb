shared_examples_for 'quarter' do
  let(:model) { described_class }
  it {
    should define_enum_for(:quarter).with_values(model.quarters)
  }
  it do
    model.quarters.flatten.each do |q|
      should allow_value(q).for(:quarter)
    end
  end
end
