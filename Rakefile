# -*- coding: utf-8 -*-
$:.unshift '/Library/RubyMotion/lib'
$:.unshift 'lib'

require 'motion/project/template/ios'
require 'lotion/project'
require 'lotion/version'

require 'guard/motion'
require 'motion-stump'

Motion::Project::App.setup do |app|
  app.name       = 'TestSuite'
  app.identifier = 'com.jeremyruppel.lotion.TestSuite'
  app.version    = Lotion::VERSION
end

require 'bundler/gem_tasks'
