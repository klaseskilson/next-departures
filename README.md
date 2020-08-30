# Next Departures 🚇

Find the next departure from any public transport stop in Stockholm.

[![preview](https://i.imgur.com/9VDcpOt.gif)](https://imgur.com/EhAG2Ra)

Uses the APIs provided by SL and Trafiklab:
- [Real time departures](https://www.trafiklab.se/node/15754/documentation)
- [Places lookup](https://www.trafiklab.se/api/sl-platsuppslag/dokumentation)

## Setup

For the experienced Rails developer, it should be rather straightforward:
```sh
cp .env .env.local
# add needed credentials to env file: https://www.trafiklab.se/hur-gor-jag
bin/bundle
bin/rspec
bin/rails s
```

## Todo

Nothing is perfect. Here are some ideas:

- [ ] strenghten spec
- [ ] get rid of all unused rails things
- [ ] actually use decent http responses for empty search results
- [ ] include some station info
- [ ] display deviation info
- [ ] deploy (with redis cache?)
