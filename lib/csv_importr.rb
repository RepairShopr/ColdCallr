class CSVImportr
  require 'csv'

  attr_accessor :file_path, :file_rows, :result, :errors

  def initialize

    @file_path = "https://dl.dropboxusercontent.com/u/15079951/cold-callr-sample-csv.csv"
    puts "You are smart!"
  end

  def import_contacts
    begin
      download_file
    rescue => ex
      puts "WOW! So this happened when downloading.. #{ex}, #{ex.backtrace}"
    end

    begin
      contacts_from_csv
    rescue => ex
      puts "WOW! So this happened when creating contacts.. #{ex}, #{ex.backtrace}"
    end
  end

  def show_errors
    @errors.each do |contact|
      puts contact.errors.messages
    end
  end

  private


  def download_file
    puts "Downloading file..."
    body = Faraday.get(@file_path).body
    @file_rows = []
    puts "Done! starting to parse.."
    CSV.parse(body, headers: true, :encoding => 'utf-8') do |row|

      extra_fields = row.headers-['name','phone']
      hash = {}
      extra_fields.each do |f|
        hash[f] = row[f]
      end

      @file_rows << {name: row['name'], phone: row['phone'], properties: hash}
    end
    puts "Alright alright alright - you have #{file_rows.size} rows in this bad boy"
  end

  def contacts_from_csv
    @result = []
    @errors = []
    @file_rows.each do |row|
      contact = Contact.new(row)
      if contact.save
        @result << contact
      else
        @errors << contact
      end
    end
    puts "Ok, you started with #{@file_rows.size} in the csv, the result is #{@result.size} new valid contacts and #{@errors.size} with issues."
  end

end