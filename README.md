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


## Get Started 

hi there - this is a simple rails app meant to just give you an API to some call log data for managing cold calling.

To fire this up:

```
rake db:migrate
rake db:seed
rails s
cd cold_callr-ember
ember serve --proxy=http://localhost:3000
```

To deploy/production build:

```
./bin/build.sh
```

Have fun
