module PageSelecta
  
  module Generate
    class << self
      
      def mixin_path
        Config.mixin_path
      end
      
      def mixin! name
        puts File.join(Dir.pwd, Config.mixin_path)
      end
       
    end
  end
  
end