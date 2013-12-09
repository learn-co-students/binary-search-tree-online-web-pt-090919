require_relative 'spec_helper'
require_relative 'binary_search_tree'

describe 'Binary Search Tree' do

  it 'retains data' do
    expect(BST.new(4).data).to eq(4)
  end

  it 'inserts lesser values to the left' do
    four = BST.new 4
    four.insert 2
    expect(four.data).to eq 4
    expect(four.left.data).to eq 2
  end

  it 'inserts lesser or equal values to the left' do
    four = BST.new 4
    four.insert 4
    expect(four.data).to eq 4
    expect(four.left.data).to eq 4
  end

  it 'inserts greater data to the right' do
    four = BST.new 4
    four.insert 5
    expect(four.data).to eq 4
    expect(four.right.data).to eq 5
  end

  it 'manages a complex tree correctly' do
    four = BST.new 4
    four.insert 2
    four.insert 6
    four.insert 1
    four.insert 3
    four.insert 7
    four.insert 5

    expect(four.data).to eq 4
    expect(four.left.data).to eq 2
    expect(four.left.left.data).to eq 1
    expect(four.left.right.data).to eq 3
    expect(four.right.data).to eq 6
    expect(four.right.left.data).to eq 5
    expect(four.right.right.data).to eq 7
  end

  def record_all_data(bst)
    all_data = []
    bst.each { |data| all_data << data }
    all_data
  end

  it 'can iterate' do
    expect(record_all_data(BST.new(4))).to eq [4]
  end

  it 'iterates in order of element size, smallest first' do
    four = BST.new 4
    four.insert 2
    expect(record_all_data(four)).to eq [2, 4]
  end

  it 'iterates in order of element size, largest last' do
    four = BST.new 4
    four.insert 5
    expect(record_all_data(four)).to eq [4, 5]
  end

  it 'iterates over a complex tree in order' do
    four = BST.new 4
    four.insert 2
    four.insert 1
    four.insert 3
    four.insert 6
    four.insert 7
    four.insert 5

    expect(record_all_data(four)).to eq [1, 2, 3, 4, 5, 6, 7]
  end
end
