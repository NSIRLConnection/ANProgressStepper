Pod::Spec.new do |s|
  s.name              = "ANProgressStepper"
  s.version           = "0.1.0"
  s.summary           = "A simple control to show the user their progress in a multi-step process such as a multi-page form."
  s.description       = <<-DESC 
 ANProgressStepper is a simple control that shows numbered circles with different background colours to provide the user with feedback on their progress through a multi-step process. 
  DESC
  s.homepage          = "https://github.com/ayushn21/ANProgressStepper"
  s.license           = 'MIT'
  s.author            = { "Ayush Newatia" => "ayush.newatia@icloud.com" }
  s.source            = { :git => "https://github.com/ayushn21/ANProgressStepper.git", :tag => s.version.to_s }
  s.social_media_url  = 'https://twitter.com/ayushn21'
  s.platform          = :ios, '7.0'
  s.requires_arc      = true
  s.source_files      = 'ANProgressStepper/*.{h,m}'
  s.frameworks        = 'Foundation'
end
