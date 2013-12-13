module Capi
  class Request
    def initialize(api_version, language)
      @endpoint = "http://api.canlii.org/#{api_version}"
      @language = language
    end

    def set_auth(api_key)
      @api_key = api_key
    end

    def get(path, params = {})

      # => If the path requires building because it's an array, then build it
      if path.is_a?(Array)
        base_path = path.first
        url = "#{@endpoint}/#{base_path}/#{@language}/" + path[1..-1].map(&:to_s).join("/")
      else
        url = "#{@endpoint}/#{path}/#{@language}/"
      end

      # => Add the params to the query string
      url += "?api_key=#{@api_key}"
      for key, value in params
        url += "&#{key.to_s}=#{value}"
      end

      # => Return the JSON response
      JSON.parse HTTParty.get(url)
    end
  end
end
