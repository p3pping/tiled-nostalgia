require 'rspec'
require_relative '../../../lib/utilities/tree_node.rb'

RSpec.describe TreeNode do
  describe 'When creating a tree,' do
    subject { TreeNode.new(Object.new) }
    context 'given a root node with no children,' do
      it 'should have no parent' do
        expect(subject.parent).to be_nil
      end
    end
  end
end
