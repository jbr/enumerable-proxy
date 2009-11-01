module EnumerableProxy
  def self.included(klass)
    klass.class_eval do
      def proxy(method) Proxy.new method, self end
      alias_method :p, :proxy
    end
  end
  
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

Enumerable.instance_eval {include EnumerableProxy}
