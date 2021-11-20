describe Lifo::Queue do
  describe "#initialize" do
    it "sets capacity to -1 if none is given" do
      queue = Lifo::Queue(Int32).new
      queue.capacity.should eq -1
    end
  end

  describe "#enqueue" do
    it "enqueues to the queue" do
      queue = Lifo::Queue(Int32).new
      queue.enqueue(1)
      queue.peek.should eq(1)
      queue.enqueue(3)
      queue.peek.should eq(1)
      queue.enqueue(5)
      queue.peek.should eq(1)
    end

    it "returns queue size" do
      queue = Lifo::Queue(Int32).new
      queue.enqueue(1)
      queue.enqueue(3)
      queue.size.should eq(2)
    end

    it "raises OverflowError if queue is full" do
      queue = Lifo::Queue(Int32).new(0)

      expect_raises(Lifo::OverflowError) do
        queue.enqueue(1)
      end
    end

    it "doesn't raise an error when queue is infinite" do
      queue = Lifo::Queue(Int32).new
      queue.enqueue(1)
    end
  end

  describe "#enqueue?" do
    it "enqueues to the queue" do
      queue = Lifo::Queue(Int32).new
      queue.enqueue?(1)
      queue.peek.should eq(1)
      queue.enqueue?(3)
      queue.peek.should eq(1)
      queue.enqueue?(5)
      queue.peek.should eq(1)
    end

    it "returns queue size" do
      queue = Lifo::Queue(Int32).new
      queue.enqueue?(1)
      queue.enqueue?(3)
      queue.size.should eq(2)
    end

    it "returns nil if error raised" do
      queue = Lifo::Queue(Int32).new(0)
      queue.enqueue?(1).should be_nil
    end
  end

  describe "#dequeue" do
    it "dequeues from the queue" do
      queue = Lifo::Queue(Int32).new
      queue.enqueue(1)
      queue.enqueue(3)
      queue.peek.should eq(1)
      queue.dequeue
      queue.peek.should eq(3)
      queue.dequeue
    end

    it "returns dequeued element" do
      queue = Lifo::Queue(Int32).new
      queue.enqueue(1)
      queue.enqueue(3)
      queue.peek.should eq(1)
      queue.dequeue.should eq(1)
      queue.dequeue.should eq(3)
    end

    it "raises UnderflowError if queue is empty" do
      queue = Lifo::Queue(Int32).new(0)
      expect_raises(Lifo::UnderflowError) do
        queue.dequeue
      end
    end
  end

  describe "#dequeue?" do
    it "dequeues from the queue" do
      queue = Lifo::Queue(Int32).new
      queue.enqueue(1)
      queue.enqueue(3)
      queue.peek.should eq(1)
      queue.dequeue?
      queue.peek.should eq(3)
      queue.dequeue?
    end
  end
end
