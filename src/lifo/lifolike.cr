module Lifo
  abstract class LifoLike(T)
    protected property data = [] of T
    getter capacity

    def initialize(@capacity = -1)
      if @capacity < -1
        raise ArgumentError.new("capacity must be >= -1")
      end
    end

    def size : Int32
      @data.size
    end

    def empty? : Bool
      size == 0
    end
  end
end
