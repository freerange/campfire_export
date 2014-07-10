## Description

A script for exporting Campfire room messages to CSV.

It does a very small bit of monkey-patching of Tinder to make it work for rooms which have been "removed", which was my original use case.

## Dependencies

* Ruby (only tested with 2.0.0p195)
* Bundler
* Tinder (in Gemfile)
* Dotenv (in Gemfile)

## Installation

* Use git to clone the repository or download it as a zip file.
* Install the bundle with `bundle install`.

## Execution

* Set the following environment variables (in `.env` file or otherwise):
  * `CAMPFIRE_SUBDOMAIN`
  * `CAMPFIRE_API_TOKEN`
  * `CAMPFIRE_ROOM_ID`
  * `CAMPFIRE_ROOM_NAME`

* Specify start date as first command line argument.
* Redirect stdout to a file as desired.

    $ ruby export.rb 2013-01-27 >my-campfire-room-messages.csv

## Credits

Campfire Export was written by [James Mead](http://jamesmead.org) and the other members of [Go Free Range](http://gofreerange.com).

## License

Campfire Export is released under the [MIT License](https://github.com/freerange/campfire_export/blob/master/LICENSE).
