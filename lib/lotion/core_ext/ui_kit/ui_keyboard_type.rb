UIKeyboardType = Lotion::Enum.new do |map|
  map[ :default                 ] = UIKeyboardTypeDefault
  map[ :ascii_capable           ] = UIKeyboardTypeASCIICapable
  map[ :numbers_and_punctuation ] = UIKeyboardTypeNumbersAndPunctuation
  map[ :url                     ] = UIKeyboardTypeURL
  map[ :number_pad              ] = UIKeyboardTypeNumberPad
  map[ :phone_pad               ] = UIKeyboardTypePhonePad
  map[ :name_phone_pad          ] = UIKeyboardTypeNamePhonePad
  map[ :email_address           ] = UIKeyboardTypeEmailAddress
  map[ :decimal_pad             ] = UIKeyboardTypeDecimalPad
  map[ :twitter                 ] = UIKeyboardTypeTwitter
  map[ :alphabet                ] = UIKeyboardTypeAlphabet
end
