require 'spec_helper'
require 'lotion/project'

describe Lotion::Project do

  describe 'files' do
    its( :files ){ should be_an( Array ) }
    its( :files ){ should include( 'lib/lotion/container.rb' ) }
  end
end
