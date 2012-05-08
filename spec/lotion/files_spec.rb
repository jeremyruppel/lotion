require 'spec_helper'

describe Lotion do
  subject { Lotion::FILES }

  let( :path ){ File.expand_path( File.join( __FILE__, '../../..' ) ) }

  it { should_not include( "#{path}/lib/lotion.rb" ) }
  it { should include( "#{path}/lib/lotion/concern.rb" ) }
  it { should include( "#{path}/lib/lotion/version.rb" ) }
end
