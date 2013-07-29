### rCloud
My hopes are to build a file storage and stream server similar to [ownCloud](http://owncloud.org/) written in ruby 2.0 / rails 4.

Project is obviously still in its infancy.  Following is a basic outline of everything I would like to accomplish with this project:

* Main
	* log in / log out - [devise](https://github.com/plataformatec/devise)
	* first user able to creat self (devise :registerable), following users must be created by admin

* Files
	* list
	* actions (delete, share, etc)
	* size
	* modified
	* upload - [paperclip](https://github.com/thoughtbot/paperclip)
		* [secure uploads](http://thewebfellas.com/blog/2009/8/29/protecting-your-paperclip-downloads)

* Music
	* html5 player
* Streaming
	* html5
	* possible other types of streaming (i.e. something [wamp-ish](http://www.wampserver.com/en/))

* sorting by artist / album / song title
	* [taglib ruby](https://github.com/robinst/taglib-ruby)
	* [id3lib-ruby](http://id3lib-ruby.rubyforge.org/)
	* [ruby mp3 info](https://github.com/arbarlow/ruby-mp3info)

* Users
	* groups
	* chat

* Calendar
	* importing various types

* Contact
	* importing various types

* Pictures

* Sync Apps
	* ios
	* android
	* osx
	* windows
	* linux
	* [ruby shoes](http://shoesrb.com/) or [ruby qt](http://zetcode.com/gui/rubyqt/) possibly for desktop cross platformness ??


* General
	* ruby testing with [Rspec](https://github.com/rspec/rspec-rails)
	* CoffeeScript testing with [jasminerice](https://github.com/bradphelan/jasminerice)
	* [HAML](https://github.com/indirect/haml-rails) templates
	* [HAMLC](https://github.com/netzpirat/haml_coffee_assets) javascript templates
	* [CoffeeScript](http://coffeescript.org/) over JS