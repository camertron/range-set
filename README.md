
## range-set [![Build Status](https://secure.travis-ci.org/camertron/range-set.png?branch=master)](http://travis-ci.org/camertron/range-set)

RangeSet is an integer set, implemented under the hood with ranges. The idea is that it's more efficient to store sequential data in ranges rather than as single elements. By definition, RangeSets contain no duplicates.

## Installation

`gem install range-set`

## Usage

```ruby
require 'range-set'
```

### Creating Range Sets

Use the `from_array` or `new` methods to create RangeSets:

```ruby
set = RangeSet.from_array([1, 2, 3, 6, 7, 8, 11, 14, 17, 18, 19])
set.to_a  # [1..3, 6..8, 11..11, 14..14, 17..19]
```

The `to_a` method takes a boolean argument that determines whether or not to turn isolated elements into zero-length ranges or leave them as single elements:

```ruby
set = RangeSet.from_array([1, 2, 3, 6, 7, 8, 11, 14, 17, 18, 19])
set.to_a(true)  # [1..3, 6..8, 11, 14, 17..19]
```

### Union

Combining two RangeSets:

```ruby
set = RangeSet.new([3..10]).union(
  RangeSet.new([9..11, 1..2, 2..3, 14..18])
)

set.to_a  # [1..11, 14..18]
```

### Intersection

Finding the elements common to two RangeSets:

```ruby
set = RangeSet.new([3..10]).intersection(RangeSet.new([1..7]))
set.to_a  # [3..7]
```

### Subtract

Removing the elements contained in one RangeSet from another:

```ruby
set = RangeSet.new([3..10]).subtract(RangeSet.new([1..5]))
set.to_a  # [6..10]
```

### Difference

The difference here means the symmetric difference (i.e. the union without the intersection)
[http://en.wikipedia.org/wiki/Symmetric_difference](http://en.wikipedia.org/wiki/Symmetric_difference)

```ruby
set = RangeSet.new([1..10]).difference(RangeSet.new([3..8]))
set.to_a  # [1..2, 9..10]
```

### Include

```ruby
set = RangeSet.new([1..5, 9..16])

set.include?(4)       # true
set.include?(6)       # false
set.include?(10..15)  # true
set.include?(4..6)    # false
```

## Requirements

No external requirements.

## Running Tests

`bundle exec rake` or `bundle exec rspec`

## License

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
