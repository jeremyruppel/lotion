require 'spec_helper'

describe Array do
  it { should respond_to( :extract_options! ) }

  context 'with an options hash' do
    let( :array ){ [ 1, 2, { :foo => 'bar' } ] }

    describe 'the array' do
      subject { array }
      before  { subject.extract_options! }

      it { should eq( [ 1, 2 ] ) }
    end

    describe 'the hash' do
      subject { array.extract_options! }

      it { should eq( :foo => 'bar' ) }
    end
  end

  context 'without an options hash' do
    let( :array ){ [ 1, 2, 3 ] }

    describe 'the array' do
      subject { array }
      before  { subject.extract_options! }

      it { should eq( [ 1, 2, 3 ] ) }
    end

    describe 'the hash' do
      subject { array.extract_options! }

      it { should eq( { } ) }
    end
  end
end
