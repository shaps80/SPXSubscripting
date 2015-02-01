Pod::Spec.new do |s|
  s.name             = "SPXSubscripting"
  s.version          = "0.1.0"
  s.summary          = "This is a library for adding subscripting support to various Foundation classes. It also adds some interesting solutions to working with NSString's, NSAttributedString's and their attributes."
  s.homepage         = "https://github.com/shaps80/SPXSubscripting"
  s.license          = 'MIT'
  s.author           = { "Shaps Mohsenin" => "shaps80@me.com" }
  s.source           = { :git => "https://github.com/shaps80/SPXSubscripting.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/shaps'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes'
end
