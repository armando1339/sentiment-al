module SentimentAl
  class Service
    class << self
      attr_reader :params, :response, :unincluded_params

      # => Run the service if it has
      # all the necessary data
      #
      def call(params)
        @params = params
        unincluded_error unless required_params?
        
        HttpRequest.new(params) do |request|
          @response = request.start
        end

        self
      end

      def successfully?
        response.code.start_with?('2')
      end

      private

      # => Search information about
      # missing data in parameters and
      # response true/false
      #
      def required_params?
        @unincluded_params = []

        required_params.each do |param|
          unless params.include?(param)
            unincluded_params << param
          end
        end

        unincluded_params.empty?
      end

      # => *
      def required_params
        %i(text)
      end

      # => *
      def unincluded_error
        raise Exception, "required params #{unincluded_params}"
      end
    end
  end
end