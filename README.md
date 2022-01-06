## Introduction

This is the Rails Take Home Test app for Figment.

##Getting Started

### When setting up a new laptop

when starting from scratch
- install XCode (not just command line)
- install homebrew, then the following:
```bash
    brew install gpg
    brew install postgres
```
- install RVM or another ruby version manager: https://rvm.io
- create .env in the project root directory
- get API_KEY from co-workers/manager and put them in the `.env` file

### Install JS dependencies

- Install nvm (https://github.com/creationix/nvm or `brew install nvm`)
- Restart Terminal
- Install node.js LTS version `nvm install --lts`
- Install the required packages in application folder `yarn`

### Install Gems

```bash
    gem install bundler
    bundle install
```

### Rails db setup

Create the database, run migrations, get transaction data
```bash
  rake db:create
  rake db:migrate
  rake get_transactions
```

### Start Rails server
To get it running fire up the server `rails s`, and visit
http://localhost:3000/.



## Requirements

Requirements:
Create a simple web app that uses
http://figment-mock-data.figment.network/near/transactions?api_key=SECRET_API_KEY endpoint to show a single page with:
1. A list of transfers with the following fields: sender, receiver and deposit.
2. A section that shows the average gas burnt for all transactions.
3. The app should display data it was able to access even if the endpoint goes offline.

##Additional information:
Near token is a currency with a scale factor of 24, so for example deposit of 716669915088987500000000000 should be displayed as "716.6699150889875 NEAR". Don't scale gas.
We’re looking for clean, modular code and that has a reasonable level of attention is paid to architectural issues, fault tolerance, error handling etc.
Not all transactions returned by the API are of type transfer .
The above endpoint will work without an API key, but assume it's required.
Styling and CSS are not important, but if you decided to use Tailwind or whatever to make a nice final product that will certainly be given credit.
The README should be thorough and complete. It should contain explanations of any questions you had, tradeoffs / decisions you made and the rationale behind them. Anyone should be able to view the README and immediately have any questions they might have about your project answered. If you do spend more than 3hrs on the task please detail the extras you might have done so that they are clearly seen and any credit given.
The Git history of the project should be representative of the work you do, and should communicate cleanly what each commit is doing.


## Caveats

I created this simple Rails application following the requirements set out in the document.

The data is obtained from the API using a rake task('rake get transactions').
I'm assuming that this rake operation can be done at regular intervals using a scheduler like cron.

After examining the data, I saw that each transaction has an excessive number of fields for my task.
I only used the fields I needed to complete the assignment, but just in case, I documented the API using a swagger.

If the database does not have any records,
I show a warning on the page that the user needs to populate the database first to see the list of transfers and the average gas burnt.

I liked this project and am happy to improve the code if necessary.

## Areas for Further Improvement

There is no limit to perfection =)

I would add a button that would allow the transaction list to be updated whenever the user wants it.
