require "./lib/linked_list"
require "./lib/node"
require "./lib/jungle_beat"

RSpec.describe JungleBeat do
  it 'exists and has attributes' do
    jb = JungleBeat.new

    expect(jb).to be_a(JungleBeat)
    expect(jb.list).to be_a(LinkedList)
    expect(jb.list.head).to eq(nil)
  end

  it 'can take each word in a string and make a node' do
    jb = JungleBeat.new

    jb.append("deep doo ditt")

    expect(jb.list.head.data).to eq("deep")
    expect(jb.list.head.next_node.data).to eq("doo")

    jb.append("woo hoo shu")
    expect(jb.count).to eq(6)
  end
end
