describe Lotion::Validations do
  subject do
    include Lotion::Validations

    attr_accessor :name

    validates :name, :presence => true
  end

  it 'responds to #valid?' do
    subject.respond_to?( :valid? ).should == true
  end
  it 'should have the correct #validators hash' do
    subject.class.validators.should be_a( Hash )
    subject.class.validators[ :name ].should be_an( Array )
    subject.class.validators[ :name ][ 0 ].should be_a( Lotion::PresenceValidator )
  end
  it 'should not be #valid? when #name is not present' do
    subject.name = nil
    subject.valid?.should == false
  end
  it 'should have the correct errors when #name is not present' do
    subject.name = nil
    subject.valid?
    subject.errors.should == { :name => [ 'is blank' ] }
  end
  it 'should be #valid? when #name is present' do
    subject.name = 'Sup'
    subject.valid?.should == true
  end
  it 'should have no errors when #name is present' do
    subject.name = 'Sup'
    subject.valid?
    subject.errors.should == { }
  end
end
