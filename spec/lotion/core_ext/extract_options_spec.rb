require 'spec_helper'
require 'lotion/core_ext/extract_options'

describe Array do
  it { should respond_to( :extract_options! ) }

  context 'with an options hash' do
    subject { [ 1, 2, :foo => 'bar' ] }

    it 'should modify the array' do
      subject.extract_options!
      subject.should == [ 1, 2 ]
    end

    it 'should return the options hash' do
      subject.extract_options!.should == { :foo => 'bar' }
    end
  end

  context 'without an options hash' do
    subject { [ 1, 2, 3 ] }

    it 'should not modify the array' do
      subject.extract_options!
      subject.should == [ 1, 2, 3 ]
    end

    it 'should return an empty hash' do
      subject.extract_options!.should == { }
    end
  end
end
