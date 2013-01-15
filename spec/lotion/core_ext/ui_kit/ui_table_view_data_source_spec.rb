describe Lotion::NamedArray do
  before do
    @subject = described_class.new 'foo'
    @subject << [ 1, 2, 3 ]
    @subject << [ 1, 2 ]
  end

  it 'has a #name' do
    @subject.name.should == 'foo'
  end
  it 'is an array' do
    @subject.is_a?( Array ).should == true
  end
  it 'can lookup by an NSIndexPath' do
    indexPath = NSIndexPath.indexPathForRow 2, inSection:0
    @subject[ indexPath ].should == 3
  end
end

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
