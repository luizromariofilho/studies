module ChuckNorris
  class Client
    include Api::HttpStatusCodes
    include Api::Exceptions

    API_ENDPOINT = 'https://api.chucknorris.io/jokes/'.freeze
    API_REQUSTS_QUOTA_REACHED_MESSAGE = 'API rate limit exceeded'.freeze

    attr_reader :oauth_token, :response

    def initialize(oauth_token = nil)
      @oauth_token = oauth_token
    end

    def random(category = nil)
      endpoint = category.blank? ? 'random' : "random?category?#{category}"
      request(
        http_method: :get,
        endpoint: endpoint
      )
    end

    def categories
      request(
        http_method: :get,
        endpoint: 'categories'
      )
    end

    private

    def client
      @_client ||= Faraday.new(API_ENDPOINT) do |client|
        client.request :url_encoded
        client.adapter Faraday.default_adapter
        # client.headers['Authorization'] = "token #{oauth_token}" if oauth_token.present?
      end
    end

    def request(http_method:, endpoint:, params: {})
      @response = client.public_send(http_method, endpoint, params)
      parsed_response = Oj.load(response.body)

      return parsed_response if response_successful?

      raise error_class, "Code: #{response.status}, response: #{response.body}"
    end

    def error_class
      case response.status
      when HTTP_BAD_REQUEST_CODE
        BadRequestError
      when HTTP_UNAUTHORIZED_CODE
        UnauthorizedError
      when HTTP_FORBIDDEN_CODE
        return ApiRequestsQuotaReachedError if api_requests_quota_reached?
        ForbiddenError
      when HTTP_NOT_FOUND_CODE
        NotFoundError
      when HTTP_UNPROCESSABLE_ENTITY_CODE
        UnprocessableEntityError
      else
        ApiError
      end
    end

    def response_successful?
      response.status == HTTP_OK_CODE
    end

    def api_requests_quota_reached?
      response.body.match?(API_REQUSTS_QUOTA_REACHED_MESSAGE)
    end
  end
end