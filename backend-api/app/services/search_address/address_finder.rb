require 'net/http'
class SearchAddress::AddressFinder
    attr_accessor :response
  def initialize(zip_code)
    @zip_code = zip_code[:zip_code]
    @response
  end

  def call
    execute!
  end
  
  def execute!
    search_address(@zip_code)
  end
  
  def search_address(zip)
      prefix_url = URI.parse("http://viacep.com.br")
      data_url = Net::HTTP.new(prefix_url.host, prefix_url.port)
      req = Net::HTTP::Get.new("#{prefix_url}/ws/#{zip}/json/")
      req["Content-Type"] = "application/json"
      req["Accept"] = "application/json"
      @response = JSON.parse(data_url.request(req).body)
  end

  def get(url, header = { 'Accept' => 'application/json' })
    RestClient.get(url, header)
  end
  
end