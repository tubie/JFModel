Pod::Spec.new do |s|
s.name         = "JFModel"
s.version      = "1.0.3"
s.summary      = "一个简单的字典转模型框架"
s.description  = <<-DESC
私有Pods测试
* Markdown 格式
DESC
s.homepage     = "https://github.com/tubie/JFModel.git"
s.license      = "MIT"
s.author             = { "linJF" => "594426995@qq.com" }
s.source       = { :git => "https://github.com/tubie/JFModel.git", :tag => s.version }

s.platform     = :ios, "7.0"
s.requires_arc = true
s.source_files  = "JFModel/*.{h,m}"
s.frameworks = 'UIKit'
end

