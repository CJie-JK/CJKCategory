
Pod::Spec.new do |spec|

  spec.name         = "CJKCategory"
  spec.version      = "0.0.4"
  spec.summary      = "CJKCategory 是一个用于保存一些常用的扩展类."

  spec.description  = <<-DESC
				CJKCategory 是一个用于保存一些常用的扩展类
                   	DESC

  spec.homepage     = "https://github.com/CJie-JK/CJKCategory"

  spec.license      = "MIT"
  
  spec.author             = { "CJie-JK" => "1164490657@qq.com" }
 
  spec.source       = { :git => "", :tag => "#{spec.version}" }

  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"


end
