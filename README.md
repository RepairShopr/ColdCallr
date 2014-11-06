== Get Started 

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
