Pod::Spec.new do |s|
  s.name             = 'PoringKit'
  s.version          = '1.0.0'
  s.summary          = 'Styling Sheet Customization For UI. Inherit From Fashion'
  s.homepage         = 'https://github.com/phoeniex/PoringKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rawipon Srivibha' => 'the.solar.space@gmail.com' }
  s.source           = { :git => 'https://github.com/phoeniex/PoringKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'src/main/**/*'

  s.dependency 'Fashion', '>= 4.0.0'
  s.dependency 'CryptoSwift', '>= 0.7.1'
end
