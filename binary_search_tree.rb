class BST
  attr_accessor :data, :left, :right

  def initialize(data, left=nil, right=nil)
    @data = data
    @left = left
    @right = right
  end

  def each(&block)
    self.left.each(&block) if self.left
    yield self.data
    self.right.each(&block) if self.right
  end

  def insert(data)
    if data <= self.data
      if self.left
        self.left.insert(data)
      else
        self.left = BST.new(data)
      end
    else
      if self.right
        self.right.insert(data)
      else
        self.right = BST.new(data)
      end
    end
  end

end