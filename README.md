Gizmo
============

In homage to its humble beginnings as our 'gremlin' testing submodule.<br />
We were entrusted with it and asked to follow 3 simple rules...

* "Don't get it wet"
* "Keep it away from bright lights....especially sunlight"
* "Don't ever feed it after midnight"

We didn't listen, and it got nasty...<br />
So we've gone back to the drawing board and come up with a friendlier, cuddlier testing helper.

**Gizmo** is a simple page model testing framework used and sponsored by [realestate.com.au](http://www.realestate.com.au). The aim of the project is to DRY up testing assertions by abstracting code that defines your page, resulting in a consistent, easy to maintain test suite. The code is maintained by Contributors from REA, and largely based on concepts brought to REA by [Mark Ryall](http://github.com/markryall) and other [thoughtworkers](http://thoughtworks.com.au/)

**this project is a work in progress, and not really ready to be used for its intended purpose!**


## Usage ##

see [this gist](http://gist.github.com/339570) for some code examples

**for cucumber:**

* write your features just like you usually would
* require 'gizmo' and add the Gizmo::Helpers to the World
* generate your page mixins and fill them out with your page selectors
* use the page model when writing your steps


**for rspec:**

* require 'gizmo' in your spec_helper and include Gizmo::Helpers methods
* generate your page mixins and fill them out with your page selectors
* use the page model when writing your specs


## Contributing ##

* Fork the project.
* Make your feature addition or bug fix.
* Make sure you write tests. Pull requests will not be accepted unless they have complete coverage.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request.

## Sponsored by ##
[realestate.com.au](http://www.realestate.com.au)