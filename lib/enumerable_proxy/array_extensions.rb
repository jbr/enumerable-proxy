module EnumerableProxy
  module ArrayExtensions
    def self.included(klass)
      %w(each map select reject all?).each do |method|
        aliased_target, punctuation = method.to_s.sub(/([?!])$/, ''), $1
        with_proxy = "#{aliased_target}_with_proxy#{punctuation}"
        without_proxy = with_proxy.sub "with", "without"

        klass.class_eval %{
          def #{with_proxy}(&blk)
            blk.nil? ? proxy(:#{method}) : #{without_proxy}(&blk)
          end
          alias_method :#{without_proxy}, :#{method}
          alias_method :#{method}, :#{with_proxy}
        }
      end
    end
  end
end

Array.instance_eval { include EnumerableProxy::ArrayExtensions }