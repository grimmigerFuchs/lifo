module Lifo
  class Queue(T) < LifoLike(T)
    def initialize(capacity = -1)
      super(capacity)
    end

    def enqueue(e : T) : Int32
      if @capacity == -1 || size < @capacity
        @data << e

        size
      else
        raise OverflowError.new
      end
    end

    def enqueue?(e : T) : Int32?
      begin
        enqueue(e)
      rescue OverflowError
        nil
      end
    end

    def dequeue : T
      begin
        res = @data.first
        @data.shift
      rescue Enumerable::EmptyError
        raise UnderflowError.new
      end

      res
    end

    def dequeue? : T?
      begin
        dequeue
      rescue UnderflowError
        nil
      end
    end

    def peek : T
      begin
        @data.first
      rescue IndexError
        raise UnderflowError.new
      end
    end

    def peek? : T?
      begin
        peek
      rescue UnderflowError
        nil
      end
    end
  end
end
