# lifo

[![GitHub release](https://img.shields.io/github/release/grimmigerFuchs/lifo.svg)](https://github.com/grimmigerFuchs/lifo/releases)

A library for working with LIFO like data structures (stacks, queues).

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     lifo:
       github: grimmigerFuchs/lifo
   ```

2. Run `shards install`

## Usage

```crystal
require "lifo"

stack = Lifo::Stack(String).new(3)
stack.push("Foo")
stack.push("Bar")
stack.push("Baz")

p! stack.pop
# stack.pop # => "Baz"
p! stack.pop
# stack.pop # => "Bar"
p! stack.peek
# stack.peek # => "Foo"

queue = Lifo::Queue(String).new(3)
queue.enqueue("John Doe")
queue.enqueue("Jane Doe")

p! queue.dequeue
# queue.dequeue # => "John Doe"
p! queue.peek
# queue.peek # => "Jane Doe"
```

## Contributing

1. Fork it (<https://github.com/grimmigerFuchs/lifo/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Dominic Grimm](https://github.com/grimmigerFuchs) - creator and maintainer
