require 'spec_helper'
require 'lotion/dependencies'

describe 'Lotion::Dependencies' do
  subject { Lotion::Dependencies( __FILE__ ) }

  it { should be_an( Array ) }
  its( :last ){ should eq( '../../lib/lotion/container.rb' ) }
end
