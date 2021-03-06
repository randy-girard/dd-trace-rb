require 'ddtrace/ext/analytics'

module Datadog
  module Contrib
    # Defines sampling behavior for integrations
    module Analytics
      module_function

      # Checks whether analytics should be enabled.
      # `flag` is a truthy/falsey value that represents a setting on the integration.
      def enabled?(flag = nil)
        # TODO: Check global flag here.
        # (global_flag && flag != false) || flag == true
        flag == true
      end

      def set_sample_rate(span, sample_rate)
        span.set_metric(Datadog::Ext::Analytics::TAG_SAMPLE_RATE, sample_rate) unless sample_rate.nil?
      end
    end
  end
end
