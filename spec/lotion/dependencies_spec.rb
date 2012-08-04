require 'spec_helper'
require 'lotion/dependencies'

describe 'Lotion::Dependencies' do
  let( :path ){ Pathname.new( __FILE__ ).dirname }

  subject { Lotion::Dependencies( __FILE__ ) }

  it { should be_an( Array ) }
  its( :last ){ should eq( path.join( '../../lib/lotion/container.rb' ).to_s ) }
end
