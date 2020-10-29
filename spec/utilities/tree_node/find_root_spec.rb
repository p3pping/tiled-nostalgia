require 'rspec'
require_relative '../../../lib/utilities/tree_node.rb'

RSpec.describe TreeNode do
  let(:root) { TreeNode.new('root') }
  let(:branch_node) { TreeNode.new('branch') }
  let(:leaf_node) { TreeNode.new('leaf') }

  before(:each) do
    branch_node << leaf_node
    root << branch_node
  end

  describe 'When searching asking for the root node,' do
    context 'given the node is a leaf node,' do
      it 'should not return itself' do
        expect(leaf_node.root).not_to be(leaf_node)
      end

      it 'should not return a branch node' do
        expect(leaf_node.root).not_to be(branch_node)
      end

      it 'should return the root node' do
        expect(leaf_node.root).to be(root)
      end
    end

    context 'given the node is a branch node,' do
      it 'should not return itself' do
        expect(branch_node.root).not_to be(branch_node)
      end

      it 'should return the root node' do
        expect(branch_node.root).to be(root)
      end
    end

    context 'given the node is a root node,' do
      it 'should return itself' do
        expect(root.root).to be(root)
      end
    end
  end
end
