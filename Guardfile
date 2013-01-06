guard 'motion', :all_after_pass => true do
  watch( 'Gemfile.lock'         )
  watch( 'app/app_delegate.rb'  )
  watch( %r{^spec/.+_spec\.rb$} )
  watch( %r{^lib/(.+)\.rb$}     ){ |m| "./spec/#{m[1]}_spec.rb" }
end
