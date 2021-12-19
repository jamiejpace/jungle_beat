class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head
      tail.next_node = Node.new(data)
    else
      @head = Node.new(data)
    end
  end

  def tail
    node = @head

    return node if !node.next_node
    return node if !node.next_node while (node = node.next_node)
  end

  def count(counter = 0, node = @head)
    if node.data && node.next_node.nil?
      counter += 1
      return counter
    elsif node.data && node.next_node
      counter += 1
      node = node.next_node
      count(counter, node)
    else
      return counter
    end
  end

  def to_string
    string = ""
    node = @head

    string += node.data

    while (node = node.next_node)
      string += " " + node.data
    end
    string
  end

  def prepend(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def insert(index, item)
    if @head.nil?
      this_node = Node.new(item)
      @head = this_node
    elsif index == 0
      this_node = Node.new(item)
      this_node.next_node = @head
      @head = this_node
    elsif index > 0
      ind = index - 1
      current = @head
      before_current = @head

      ind.times do
          before_current = current.next_node
      end

      index.times do
          current = current.next_node
      end

      this_nod = Node.new(item)
      after_current = before_current.next_node

      before_current.next_node = this_nod
      this_nod.next_node = after_current
    end
  end

  def find(index, num_items)
    string = ""
    if index == 0
      node = @head
      string += node.data
      (num_items - 1).times do
        string += " " + node.next_node.data
        node = node.next_node
      end
    else index > 0
      node = @head
      current_node = @head
      index.times do
        current_node = current_node.next_node
      end

      string += current_node.data
      current_node = current_node.next_node
      (num_items - 1).times do
        string += " " + current_node.data
        current_node = current_node.next_node
      end
    end
    string
  end

  def includes?(data)
    to_string.include?(data)
  end

  def pop
    if @head.next_node.nil?
      @head = nil
    else
      current = @head
      up_next = current.next_node
      until up_next.next_node.nil?
        current = up_next
        up_next = up_next.next_node
      end
      current.next_node = nil
    end
  end
end
