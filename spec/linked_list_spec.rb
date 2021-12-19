require "./lib/linked_list"
require "./lib/node"
RSpec.describe LinkedList do
  it 'exists and has attributes' do
    list = LinkedList.new

    expect(list).to be_a(LinkedList)
    expect(list.head).to eq(nil)
  end

  it 'adds a head node' do
    list = LinkedList.new

    list.append("doop")

    expect(list.head).to be_a(Node)
    expect(list.head.data).to eq("doop")
    expect(list.head.next_node).to eq(nil)
  end

  it 'counts the number of nodes in a list' do
    list = LinkedList.new

    list.append("doop")

    expect(list.count).to eq(1)
  end

  it 'creates a string of data from head node' do
    list = LinkedList.new

    list.append("doop")

    expect(list.to_string).to eq("doop")
  end

  it 'appends to end of list' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.head.next_node).to be_a(Node)
    expect(list.head.next_node.data).to eq("deep")
    expect(list.count).to eq(2)
    expect(list.to_string).to eq("doop deep")
  end

  it 'prepends a node to the front of the list' do
    list = LinkedList.new
    list.append("plop")

    expect(list.to_string).to eq("plop")

    list.append("suu")
    list.prepend("dop")

    expect(list.to_string).to eq("dop plop suu")
    expect(list.count).to eq(3)
  end

  it 'can insert a node at a given index' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")

    expect(list.to_string).to eq("dop woo plop suu")
  end

  it 'can insert a node at a 0 index' do
    list = LinkedList.new
    list.append("plop")
    list.insert(0, "woo")

    expect(list.to_string).to eq("woo plop")
  end

  it 'can insert a node at a given index if the head is nil' do
    list = LinkedList.new
    list.insert(1, "woo")

    expect(list.head.data).to eq("woo")
    expect(list.to_string).to eq("woo")
  end

  it 'finds an the node at 0 index and returns the given number of items' do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.find(0, 3)).to eq("deep woo shi")
  end

  it 'finds the node at a given index and returns the given number of items' do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.find(2, 1)).to eq("shi")
    expect(list.find(1, 3)).to eq("woo shi shu")
  end

  it 'can assess whether a given string is included in a linked list' do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.includes?("deep")).to eq(true)
    expect(list.includes?("dep")).to eq(false)
  end

  it 'can remove a string from a linked list' do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    list.pop
    list.pop

    expect(list.to_string).to eq("deep woo shi")
  end
end
