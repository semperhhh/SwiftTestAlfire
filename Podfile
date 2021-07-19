# Uncomment the next line to define a global platform for your project
 platform :ios, '14.0'

target 'SwiftTestAlfire' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SwiftTestAlfire
  pod 'Alamofire', '~> 5.4'
  pod 'SnapKit', '~> 5.0.0'
  pod 'SwiftLint', '0.43.1', configurations: ['Debug']
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
  pod 'MJRefresh', '~> 3.7.2'
  pod 'SwiftyJSON', '~> 5.0.1'
  pod 'HandyJSON', '~> 5.0.3-beta'
  pod 'Kingfisher', '~> 6.0'
  
  #  local
  pod 'DesignKit', :path => './Frameworks/DesignKit', :inhibit_warnings => false
  pod 'ZPHSuppleKit', :path => './Frameworks/ZPHSuppleKit', :inhibit_warnings => false

  target 'SwiftTestAlfireTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SwiftTestAlfireUITests' do
    # Pods for testing
  end

end
