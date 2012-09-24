require 'spec_helper'
require 'lotion/project'

describe Lotion::Project do
  let( :app  ){ double 'app' }
  let( :path ){ __FILE__ } # for testing, use the path from this spec

  let( :project ){ described_class.new( app, path ) }

  describe 'root' do
    subject { project }
    its( :root ){ should eq( Pathname.new( path ).dirname ) }
  end

  describe 'files' do
    subject { project }
    its( :files ){ should be_an( Array ) }
    its( :files ){ should include( '../../lib/lotion/container.rb' ) }
  end
end
