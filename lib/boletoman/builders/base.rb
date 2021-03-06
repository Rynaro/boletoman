module Boletoman
  module Builders
    class Base
      attr_reader :data

      def initialize(data)
        @data = data
      end

      def build
        instance.to_pdf
      end

      def instance
        raise NotImplementedError
      end

      def self.generator
        to_s.demodulize.downcase
      end

      # segunda via
      def duplicate?
        data.dig(:boleto, :duplicate) == true
      end
    end
  end
end
