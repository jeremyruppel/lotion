describe Lotion::Form::Delegate do
  subject do
    include Lotion::Form::Delegate
  end

  before do
    data = [ ]
    data << begin
      section = [ :_, :_, :_ ]
      section.stub! :title, :return => 'Foo'
      section
    end
    data << begin
      section = [ ]
      section.stub! :title, :return => 'Bar'
      section
    end

    subject.stub! :data, :return => data
  end

  it 'implements #numberOfSectionsInTableView' do
    subject.numberOfSectionsInTableView( nil ).should == 2
  end
  it 'implements #tableView:titleForHeaderInSection' do
    subject.tableView( nil, titleForHeaderInSection:0 ).should == 'Foo'
  end
  it 'implements #tableView:numberOfRowsInSection' do
    subject.tableView( nil, numberOfRowsInSection:0 ).should == 3
  end
  it 'implements #tableView:cellForRowAtIndexPath' do
    subject.respond_to?( 'tableView:cellForRowAtIndexPath' ).should == true
  end
end
