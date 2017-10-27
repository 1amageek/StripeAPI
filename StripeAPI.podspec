Pod::Spec.new do |s|

  s.name         = "StripeAPI"
  s.version      = "0.0.5"
  s.summary      = "Stripe API"
  s.description  = <<-DESC
With Stripe API you can use Stripe type-safely. https://stripe.com/docs/api
                   DESC

  s.homepage     = "https://stripe.com/docs/api"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "1amageek" => "tmy0x3@icloud.com" }
  s.social_media_url   = "http://twitter.com/1amageek"
  s.platform     = :ios
  s.ios.deployment_target = "10.0"
  #s.osx.deployment_target = "10.7"
  #s.watchos.deployment_target = "2.0"
  #s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/1amageek/StripeAPI.git", :tag => "#{s.version}" }
  s.source_files  = "StripeAPI/**/*.swift"
  s.requires_arc = true
  s.dependency "APIKit", "~> 3.1.1"
  s.dependency "Stripe", "~> 11.3.0"

end
