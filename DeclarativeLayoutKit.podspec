Pod::Spec.new do |spec|

  spec.name         = "DeclarativeLayoutKit"
  spec.version      = "2.0.3"
  spec.summary      = "UIKit declarative layout like SwiftUI."
  spec.homepage     = "https://github.com/Ernest0-Production/DeclarativeLayoutKit"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author       = { "Ernest" => "magatar136@yandex.ru" }
  spec.social_media_url   = "https://twitter.com/Ernest0N"

  spec.platform     = :ios
  spec.ios.deployment_target = '10.0'
  spec.swift_versions = ['5.0', '5.1', '5.2', '5.3']


  spec.source       = {
    :git => "https://github.com/Ernest0-Production/DeclarativeLayoutKit.git",
    :branch => "master",
    :tag => "#{spec.version}"
   }
  spec.source_files  = "Sources/DeclarativeLayoutKit/**/*.swift"

  spec.dependency "SnapKit", "~> 5.0"
end
