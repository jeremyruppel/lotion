describe Lotion::Form do

  subject Lotion::Form do
    section 'Section One'
    def email
      'email!'
    end
    def password
      "password! #{rand}"
    end
    section 'Section Two'
    def username
      'username!'
    end
  end

  it 'implements UITableViewDataSource' do
    subject.is_a?( Lotion::UITableViewDataSource ).should == true
  end
  it 'has two sections' do
    subject.data.count.should == 2
  end
  it 'names the first section' do
    subject.data.first.name.should == 'Section One'
  end
  it 'gives the first section two cells' do
    subject.data.first.count.should == 2
  end
  it 'names the second section' do
    subject.data.second.name.should == 'Section Two'
  end
  it 'gives the second section one cell' do
    subject.data.second.count.should == 1
  end
  it 'provides access to the inputs by name' do
    subject.inputs[ :email ].should == 'email!'
  end
  it 'caches the inputs in the #inputs hash' do
    subject.inputs[ :password ].should == subject.inputs[ :password ]
  end
end
