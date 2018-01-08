Pod::Spec.new do |s|
  s.name         = "MWTableView"
  s.version      = "0.0.1"
  s.summary      = "MWTableView"
  s.description  = "MWTableView description"
  s.homepage     = "https://github.com/mingway1991/MWTableView"
  s.license      = "MIT"
  s.author       = { "shimingwei" => "mingwei.shi@hotmail.com" }
  s.source       = { :git => "https://github.com/mingway1991/MWTableView.git", :tag => "#{s.version}" }
  s.source_files = "MWTableView/**/*.{h,m}"
  s.requires_arc = false
  s.ios.deployment_target = '7.0'
  s.frameworks = 'UIKit'
end
