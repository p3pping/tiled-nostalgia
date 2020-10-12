require 'rspec'
require_relative '../../../lib/utilities/tree_node.rb'

RSpec.describe TreeNode do
  describe 'When adding a child node to root node,' do
    let(:root) { TreeNode.new(Object.new) }
    let(:child) { TreeNode.new(Object.new) }
    subject { root.add_child(child) }

    context 'given a root node,' do
      it 'the roots parent should not change.' do
        expect{ subject }.not_to change { root.parent }
      end

      it 'the roots node children should increase by 1.' do
        expect{ subject }.to change { root.children.count }.by(1)
      end

      it 'the childs parent should change to be the root.' do
        expect{ subject }.to change { child.parent }.to be(root)
      end
    end

    context 'given the root is already the parent node,' do
      before(:each) do
        root.add_child(child)
      end

      it 'the roots node children should not change.' do
        expect{ subject }.not_to change { child.children.count }
      end
    end

    context 'given the node is being added to its self,' do
      subject { root.add_child(root) }

      it 'an error should be raised.' do
        expect{ subject }.to raise_error(ArgumentError)
      end
    end
  end
end
