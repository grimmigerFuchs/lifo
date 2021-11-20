module Lifo
  class Stack(T) < LifoLike(T)
    def initialize(capacity = -1)
      super(capacity)
    end

    def push(e : T) : Int
      if @capacity == -1 || size < @capacity
        @data << e

        size
      else
        raise OverflowError.new
      end
    end

    def push?(e : T) : Int?
      begin
        push(e)
      rescue OverflowError
        nil
      end
    end

    def pop : T
      begin
        res = @data.last
        @data.pop
      rescue IndexError
        raise UnderflowError.new
      end

      res
    end

    def pop? : T?
      begin
        pop
      rescue UnderflowError
        nil
      end
    end

    def peek : T
      begin
        @data.last
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
