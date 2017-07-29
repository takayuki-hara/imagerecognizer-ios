# Uncomment this line to define a global platform for your project
platform :ios, '8.0'

# Uncomment this line if you're using Swift
use_frameworks!

target 'ImageRecognition' do
    #pod 'Alamofire'
    #pod 'ObjectMapper'
    #pod 'RealmSwift'

    pod 'R.swift'
    pod 'SwiftyUserDefaults'
    pod 'ChameleonFramework'
    pod 'Kingfisher'
end

# Copy License File
post_install do | installer |
   require 'fileutils'
   
   #Pods-ImageRecognition-acknowledgements.plistを移動する
   FileUtils.cp_r('Pods/Target Support Files/Pods-ImageRecognition/Pods-ImageRecognition-acknowledgements.plist', 'ImageRecognition/Supporting Files/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
   
end
