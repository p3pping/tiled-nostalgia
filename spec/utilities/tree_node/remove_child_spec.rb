require 'rspec'
require_relative '../../../lib/utilities/tree_node.rb'

RSpec.describe TreeNode do
  describe 'When removing a child node from a parent node,' do
    let(:parent) { TreeNode.new(Object.new) }
    let(:child) { TreeNode.new(Object.new) }
    subject { parent.remove_child(child) }

    context 'given a root node,' do
      before(:each) do
        parent.add_child(child)
      end

      it 'the parent should change to be nil' do
        expect{ subject }.to change { child.parent }.to be_nil
      end

      it "the parent node's children should decrease by 1." do
        expect{ subject }.to change { parent.children.count }.by(-1)
      end

      it "the parent should no longer include the child" do
        expect{ subject }.to change { parent.children.include?(child) }.to be(false)
      end
    end

    context 'given the root is not the parent node,' do
      it "the parent node's children should not change." do
        expect{ subject }.not_to change { child.children.count }
      end
    end
  end
end
