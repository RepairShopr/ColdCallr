task :cleanup_repairshopr_do_not_call do
  api = TroysAPIClient.new(ENV['RS_SUBDOMAIN'],ENV["RS_API_KEY"])


  Contact.where(created_at: Time.now-1.month..Time.now).where(status: "Do Not Call").find_each do |c|
    customers = api.search_customers(c.name)
    puts "DOING: #{c.id}"

    if customers['customers'].size > 0
      begin
        customer = customers['customers'].first

        customer['properties']['List Segment'] = "POSTCARD_DO_NOT_CALL"

        result = api.update_customer(customer['id'],customer)
        sleep 0.5
      rescue => ex
        puts ex
      end
      next
    else
      next
    end
  end

end