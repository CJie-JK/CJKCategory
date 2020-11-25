
Pod::Spec.new do |spec|

  spec.name         = "CJKCategory"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of CJKCategory."

  spec.description  = <<-DESC
				CJKCategory 是一个用于保存一些常用的扩展类
                   	DESC

  spec.homepage     = "http://github.com/CJie-JK/CJKCategory"

  spec.license      = "MIT"
  
  spec.author             = { "CJie-JK" => "1164490657@qq.com" }
 
  spec.source       = { :git => "http://github.com/CJie-JK/CJKCategory.git", :tag => "#{spec.version}" }

  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"


end
