# README

Sherlock is a search page using Solr as engine with sunspot gem.

This project depends on Ruby described at `.ruby-version` file, if you dont known Ruby, take a look
at [this](https://www.ruby-lang.org/en/documentation/installation/) and it is a good idea to use a manager like `rvm`, take a look [here](https://rvm.io/rvm/install).

With ruby installed,

After you've cloned the project,

`cd sherlock`

`gem install bundler`

`bundle install`

`docker run -d -p 5432:5432 -e AUTH=no postgres:alpine`

`rake db:create`

`rake db:migrate`

`rake sunspot:solr:start` will start a solr development instance

`rake db:seed` will load SpocketProducts.json file at project's root to db

Normally the insert operation is OK to index the items on solr, but if you have some issue with empty search, just do:

`rake sunspot:solr:reindex`

`rake sunspot:solr:restart`

Run the rails itself:

`rails s`

It will be on localhost:3000

# Some considerations
 - I chose solr to try with and learn something new to me, but I ran into issues with this development instance that do not reindex items properly.
 - Another issue with the Suspot gem is with pagination, which is recomended to make with cursor, but unfortunately I discover that kaminari does not use cursor at 45' of second round, so pagination is not working at all.
 - Tests is unfinished, only wrote the scenarios and contexts to show and idea of what I would test..
 - To go to production, the indexing part of solr should be handled by some queue to not affect the update / create requests, and of corse using some real solr instance with replicas.
 - I regret that did not used elasticsearch with chewy gem that was my 2 main options as I started the test.(but in any case, it worths the experience!)

