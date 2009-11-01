require 'enumerable_proxy'

module EnumerableProxy
  module ArrayPMethods
    def self.included(klass)
      %w(each map select reject all? any? detect).each do |method|
        klass.class_eval %{
          def p#{method}(&blk)
            blk.nil? ? proxy(:#{method}) : #{method}(&blk)
          end if instance_methods.include?(method)
        }
      end
    end
  end
end

Array.instance_eval { include EnumerableProxy::ArrayPMethods }
