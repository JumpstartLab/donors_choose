require 'donors_choose/utils/static_struct'

describe DonorsChoose::Utils::StaticStruct do
  let(:params) { {:foo => 'foo', :bar => 'bar'} }

  it "is able to initialize with params" do
    described_class.new(params).should be_instance_of(described_class)
  end

  it 'creates only getters' do
    described_class.new(params).methods(false).map(&:to_sym).should == [:foo, :bar]
  end

  it 'returns seted param' do
    described_class.new(params).foo.should == 'foo'
  end
end
