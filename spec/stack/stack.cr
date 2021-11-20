describe Lifo::Stack do
  describe "#initialize" do
    it "sets capacity to -1 if none is given" do
      stack = Lifo::Stack(Int32).new
      stack.capacity.should eq -1
    end
  end

  describe "#push" do
    it "pushes to the stack" do
      stack = Lifo::Stack(Int32).new
      stack.push(1)
      stack.peek.should eq(1)
      stack.push(3)
      stack.peek.should eq(3)
    end

    it "returns stack size" do
      stack = Lifo::Stack(Int32).new
      stack.push(1)
      stack.push(3)
      stack.size.should eq(2)
    end

    it "raises OverflowError if stack is full" do
      stack = Lifo::Stack(Int32).new(0)

      expect_raises(Lifo::OverflowError) do
        stack.push(1)
      end
    end

    it "doesn't raise an error when stack is infinite" do
      stack = Lifo::Stack(Int32).new
      stack.push(1)
    end
  end

  describe "#push?" do
    it "pushes to the stack" do
      stack = Lifo::Stack(Int32).new
      stack.push?(1)
      stack.peek.should eq(1)
      stack.push?(3)
      stack.peek.should eq(3)
    end

    it "returns stack size" do
      stack = Lifo::Stack(Int32).new
      stack.push?(1)
      stack.push?(3)
      stack.size.should eq(2)
    end

    it "returns nil if error raised" do
      stack = Lifo::Stack(Int32).new(0)
      stack.push?(1).should be_nil
    end
  end

  describe "#pop" do
    it "pops from the stack" do
      stack = Lifo::Stack(Int32).new
      stack.push(1)
      stack.push(3)
      stack.peek.should eq(3)
      stack.pop
      stack.peek.should eq(1)
      stack.pop
    end

    it "returns popped element" do
      stack = Lifo::Stack(Int32).new
      stack.push(1)
      stack.push(3)
      stack.pop.should eq(3)
      stack.pop.should eq(1)
    end

    it "raises UnderflowError if stack is empty" do
      stack = Lifo::Stack(Int32).new
      expect_raises(Lifo::UnderflowError) do
        stack.pop
      end
    end
  end

  describe "#pop?" do
    it "pops from the stack" do
      stack = Lifo::Stack(Int32).new
      stack.push(1)
      stack.push(3)
      stack.peek.should eq(3)
      stack.pop?
      stack.peek.should eq(1)
      stack.pop?
    end

    it "returns popped element" do
      stack = Lifo::Stack(Int32).new
      stack.push(1)
      stack.push(3)
      stack.peek.should eq(3)
      stack.pop?.should eq(3)
      stack.peek.should eq(1)
      stack.pop?.should eq(1)
    end

    it "returns nil if stack is empty" do
      stack = Lifo::Stack(Int32).new
      stack.pop?.should be_nil
    end
  end

  describe "#peek" do
    it "returns top element" do
      stack = Lifo::Stack(Int32).new
      stack.push(2)
      stack.peek.should eq(2)
    end

    it "raises UnderflowError if stack is empty" do
      stack = Lifo::Stack(Int32).new
      expect_raises(Lifo::UnderflowError) do
        stack.peek
      end
    end
  end

  describe "#peek?" do
    it "returns top element" do
      stack = Lifo::Stack(Int32).new
      stack.push(1)
      stack.push(3)
      stack.peek?.should eq(3)
    end

    it "returns nil if stack is empty" do
      stack = Lifo::Stack(Int32).new
      stack.peek?.should be_nil
    end
  end

  describe "#size" do
    it "returns stack size" do
      stack = Lifo::Stack(Int32).new
      stack.push(1)
      stack.push(3)
      stack.size.should eq(2)
    end
  end

  describe "#empty?" do
    it "returns true if stack is empty" do
      stack = Lifo::Stack(Int32).new
      stack.empty?.should be_true
    end

    it "returns false if stack is not empty" do
      stack = Lifo::Stack(Int32).new
      stack.push(1)
      stack.empty?.should be_false
    end
  end
end
