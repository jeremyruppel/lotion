describe Lotion::UITableViewDataSource do

  subject do
    include Lotion::UITableViewDataSource
  end

  before { @tableView = double 'tableView' }

  before do
    subject.data << [ 1, 2, 3 ]
    subject.data.last.stub! :name, :return => 'Section One'
    subject.data << [ 1, 2 ]
    subject.data.last.stub! :name, :return => 'Section Two'
  end

  it 'implements #numberOfSectionsInTableView' do
    subject.numberOfSectionsInTableView( @tableView ).should == 2
  end
  it 'implements #tableView:titleForHeaderInSection' do
    subject.tableView( @tableView, titleForHeaderInSection:0 ).should == 'Section One'
    subject.tableView( @tableView, titleForHeaderInSection:1 ).should == 'Section Two'
  end
  it 'implements #tableView:numberOfRowsInSection' do
    subject.tableView( @tableView, numberOfRowsInSection:0 ).should == 3
    subject.tableView( @tableView, numberOfRowsInSection:1 ).should == 2
  end
end
