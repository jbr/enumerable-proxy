module Enumerable
  def proxy(method) Proxy.new method, self end
  
  class Proxy
    instance_methods.each { |m| undef_method m unless m =~ /^__/ }
    
    def initialize(method, enumerable)
      @method, @enumerable = method, enumerable
    end
    
    def method_missing(method, *args)
      @enumerable.send(@method) {|a| a.send method, *args}
    end
  end
end

class Array
  %w(each map select reject all?).each do |method|
    aliased_target, punctuation = method.to_s.sub(/([?!])$/, ''), $1
    with_proxy = "#{aliased_target}_with_proxy#{punctuation}"
    without_proxy = with_proxy.sub "with", "without"

    class_eval %{
      def #{with_proxy}(&blk)
        blk.nil? ? proxy(:#{method}) : #{without_proxy}(&blk)
      end
      alias_method :#{without_proxy}, :#{method}
      alias_method :#{method}, :#{with_proxy}
    }
  end
end