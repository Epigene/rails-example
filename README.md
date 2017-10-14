# README

This is a sample Rails app for PostgreSQL nontrivial query testing.  
It implements core associations and robust seed data so you can jump in and test some queries.

There are also some advanced, commonly needed query scopes you can learn from (like selecting last book of every author).  

This is the data model:  
![Image of SampleRailsApp data structure erd](https://github.com/Epigene/rails-example/blob/master/images/data_structure.png)

## Installation

1. Make sure you have `PostgreSQL ~> 9.6` set up as the relational database
2. Consult the gemfile, set up needed Ruby version and bundler
3. `bundle` to install needed gems
4. Consult `config/database_example.yml` to make your own `config/database.yml` file  
5. Set up database contents with `rake db:create db:migrate db:seed`

## Use
You have rspec and factory girl with core factories set up to use as you please.  
Alternatively, you can perform raw queries on the seeded development database by running `rails dbconsole` and then some SQL.  

## Spec setup strategy benchmarking
As of 2017-10-15 this repo implements RSpec profiling to determine how fast different setup strategies are. See [the writeup](https://todo.com).

```
$ rspec spec/setup_benchmark.rb
# and look at the output of spec/group_profiling_results.csv
```

## Contributing
You will probably want to just fork this repo and hack on the copy however you like.  
If, however, you think that this core repo could use an update, open an issue and we will come to an agreement on what to do. :star:
