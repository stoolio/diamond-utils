diamond-utils
=============

## What?

I have a crazy idea that one could represent diamond grades as objects allowing a very declaritive and straightforward way of then declaring actual diamonds, certificates, searches etc.

This or some parts of it, may also have some use in a wrapper for the RapNet API.

This is all very speculative at this point, and it may end up being a pointless exercise.

I will include some more detailed information about the grades, certificates, and other necessary info at some point, so look for that.

## Diamond Pack

The other project this repo will currently house is DiamondPack, a compact way to store and transfer diamond info. The idea is to be able to do sorting and searching client side, necessitating transfer of all diamond info the client. The current methods in the industry rely on server side filtering and sorting.

## The Facts

The Color class is the current testbed and this is the basics of its construction:

Diamonds::Color is a module containing everything relating to color. The others will end up being very similar in construction, so once it's working relatively well it should be easy to extract out the common core and use it to build out other grades.

***

Currently, it contains:

### Variables

* VALID - an array of valid symbols for this grade
* Constants generated from the VALID array to represent the grades

Since a grade is a grade, it doesn't make sense to have more than one representation (instance) of it. We could allow multiple instances and compare on the internal symbol representation, but the current method allows us to do something like:

    class Foo
      include Diamonds::Grades::Color

      def initialize
        @my_color = D
        @another_color = F
      end
    ...

### Module Methods

* normalize - coerces it's input to a Grade compatible representation, aliased to Color() for use similar to Ruby's String() or Array() methods
* get - uses the normalize function to get the proper constant

### Classes

Both of these classes will hopefully be able to be generalized for use across all grades via inheritance or metaprogramming magic.

* Grade - responsible for representing a grade and the associated logic (comparing etc). The fancy stuff is implemented via Ruby comparable
* ColorRange - This needs a better name, but Range won't work. In the diamond industry a range is represented as D-G, not D..G (see Grade class). This is just a convenience for display at this point.

***

Again, this is all just wild speculation at this point.

I've been jumping back and forth between using a symbol as the internal representation, to the current form of using a number (which happens to be the index into the VALID array)

Ranges and comparison currently work, but there are a few things that I'm not happy with:

* In order for ranges to work, we need <=> to compare the wrong way

Properly, D is the best grade. Therefore, D > E and so on. This does not work out of the box while utilizing letters as an internal representation or starting numbers at 0. The right answer is probably to represent the grades as numbers backwards, so D would be 22 internally. This would save having to provide > and < methods

* You can still create new instances of the Diamond::Color::Grade object

I've tried setting new to private, but that doesn't seem to work. I'm too tired right now to track down my oversight. Regardless, the whole thing feels off to me. There must be a clearer way.
