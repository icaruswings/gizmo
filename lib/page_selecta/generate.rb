module PageSelecta
  
  module Generate
    class << self
      
      def mixin_path
        Config.mixin_path
      end
      
      def mixin! name
        File.join(Dir.pwd, Config.mixin_path)
      end
       
    end
  end
  
end