[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
[![Build Status](https://snap-ci.com/RepairShopr/ColdCallr/branch/master/build_image)](https://snap-ci.com/RepairShopr/ColdCallr/branch/master)

## What is it?

Just a simple app you can spin up to give your sales team a tool to manage cold calling.

It should just handle simply:

* uploading lists of contacts
* basic user login
* simple dispositioning
* adding call notes
* powerful API for querying this data from your other apps
 
The idea is, you have your cold calling happening here in this app, and your main app can query this app for phone numbers/business names and look for status and call notes. If there are records, you might then want to bring those in as annotations to your customer.

Example flow;

1. Import your list of contacts to the app
2. Your sales team does their magic
3. You end up with many contacts in the system that have notes and statuses - including do_not_call booleans
4. When new accounts sign up for your software, you query the coldcallr api for their phone number, and if there are notes/etc - you might want to attribute that signup to your salesperson!


![Screenshot](https://dl.dropboxusercontent.com/u/15079951/repairshopr/ColdCallrEmber.png)

## Setup Script

run `./bin/setup.sh` to create your DB and setup dependencies for the ember application


## Get Started 

If you ran the setup script without errors then your rails server and ember apps should be ready

```
rails s
cd cold_callr-ember
ember serve --proxy=http://localhost:3000
```

To deploy/production build:

```
./bin/build.sh
```

To get your own contacts imported, just get a heroku console going and;

```
heroku run console
csv_importer = CSVImportr.new
csv_importer.file_path = "http://path_to_file.com/file.csv"
csv_importer.import_contacts
```

You can view the errors with;

```
csv_importer.show_errors
```

It expects your CSV data to look like this: https://dl.dropboxusercontent.com/u/15079951/cold-callr-sample-csv.csv

For our purposes, this app is going through a list of potential contacts and showing them to a sales person. You might not 100% trust your list to be de-duplicated from your active customers, and that exists in another rails app. 

ColdCallr will proxy that request and can go get external contacts from a remote API endpoint. For us that means, when you are about to call someone, we are doing a live query against the postal code for existing customers and showing that to the sales rep. They get this one last chance to make sure the current contact isn't a duplicate.

If you want to use your existing CRM or live app to populate the "Existing Contacts" area, you can setup an action in your 'main app' like this:

(Our contacts are called Accounts in the other app - and we use a zip column instead of postal, so you can easily see how to translate here)

```ruby
 def cold_callr
    if params[:token] == 'sometokenforsecurity'
      accounts = Account.where(zip: params[:postal])
      render json: {external_contacts: accounts.paginate(per_page: 20, page: params[:page]).map{|a| {id: a.id, name: a.name, phone: a.phone, properties: a.attributes.map{|i| "#{i[0]}:#{i[1]}"}.join(",")}}}.to_json
    else
      render json: {fail: 'not logged in'}, status: :unauthorized
    end

  end
  ```
  
  To start the server with your existing contact endpoint, setup a couple environment variables:
  
  ```
  EXTERNAL_API_ENDPOINT=http://localhost:4000/api/accounts/cold_callr API_TOKEN=supersecrettoken rails s -p 4002
  ```

Have fun
