class TroysAPIClient

  attr_accessor :subdomain, :api_key, :base_url, :api_version

  def initialize subdomain,api_key
    @subdomain = subdomain
    @api_key = api_key
    @api_version = "/api/v1"
  end

  def base_url
    @base_url ||= "http://#{subdomain}.lvh.me:3000" if Rails.env.development?
    @base_url ||= "https://#{subdomain}.repairshopr.com"
  end

  def customers
    response = Faraday.get "#{base_url}/#{@api_version}/customers.json?api_key=#{@api_key}"
    JSON.parse response.body
  end

  def search_customers(query)
    response = Faraday.get "#{base_url}/#{@api_version}/customers.json?api_key=#{@api_key}&query=#{query}"
    JSON.parse response.body
  end

  def autocomplete query
    response = Faraday.get "#{base_url}/#{@api_version}/customers/autocomplete.json?api_key=#{@api_key}&query=#{query}"
    JSON.parse response.body
  end

  def invoices
    response = Faraday.get "#{base_url}/#{@api_version}/invoices.json?api_key=#{@api_key}"
    JSON.parse response.body
  end

  def tickets
    response = Faraday.get "#{base_url}/#{@api_version}/tickets.json?api_key=#{@api_key}"
    JSON.parse response.body
  end

  def vendors
    response = Faraday.get "#{base_url}/#{@api_version}/vendors.json?api_key=#{@api_key}"
    JSON.parse response.body
  end

  def schedules
    response = Faraday.get "#{base_url}/#{@api_version}/schedules.json?api_key=#{@api_key}"
    JSON.parse response.body
  end

  def create_customer params
    setup_connection
    response = @conn.post "#{api_version}/customers.json?api_key=#{@api_key}", params
    JSON.parse response.body
  end

  def create_vendor params
    setup_connection
    response = @conn.post "#{api_version}/vendors.json?api_key=#{@api_key}", params
    JSON.parse response.body
  end

  def create_schedule params
    setup_connection
    response = @conn.post "#{api_version}/schedules.json?api_key=#{@api_key}", params
    JSON.parse response.body
  end

  def demo_customer
    new_cust = {}
    new_cust[:firstname] = 'JonnyAPI'
    new_cust[:lastname] = 'SmithAPI'
    new_cust[:phone] = '4256611'
    new_cust[:email] = 'john+123@repairshopr.com'
    create_customer new_cust
  end


  def create_invoice params
    setup_connection
    response = @conn.post "#{@api_version}/invoices.json?api_key=#{@api_key}", params
    JSON.parse response.body
  end

  def create_ticket params
    setup_connection
    response = @conn.post "#{@api_version}/tickets.json?api_key=#{@api_key}", params
    JSON.parse response.body
  end

  def create_comment params
    setup_connection
    response = @conn.post "#{@api_version}/tickets/#{params[:number]}/comment.json?api_key=#{@api_key}", params
    JSON.parse response.body
  end

  def demo_invoice
    new_invoice = {}
    new_invoice[:customer_id] = '120018'
    new_invoice[:date] = '2013-05-25'
    new_invoice[:line_items] = [
        {item: 'Some Item', name: 'Some big description', cost: 0.0, price: 19.99, quantity: 1}
    ]
    create_invoice new_invoice
  end

  def setup_connection
    @conn = Faraday.new(:url => "#{base_url}" ) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end