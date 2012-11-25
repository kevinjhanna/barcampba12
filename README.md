# BarCampBA12
Basic Cuba app based on [this presentation](https://speakerdeck.com/kevinjhanna/ruby-plus-cuba-plus-ohm) I gave in BarCampBA 2012.


The idea of this app is to show Rails developers or developers new to Ruby how to build a simple app
using Ruby with [Cuba](https://github.com/soveran/cuba) (based on Rack)
and [Ohm](https://github.com/soveran/ohm) (that relies on Redis).


If you find any mistakes please let me know or submit a pull request.


## Instructions to try the app:
 1. Run a redis server on port 6379.
 2. Install dep, a [basic dependency tracking](https://github.com/twpil/dep) gem.
 3. Run `dep install` to install the necessary gems.
 4. Fire up `shotgun` or `rackup`.


## More:
  *  [Why Cuba](http://files.soveran.com/cuba/#0)
  *  [Why Dep and not Bundler](https://github.com/twpil/dep#history)
  *  [About Redis](http://redis.io/topics/faq)



