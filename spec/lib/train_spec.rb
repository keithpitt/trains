require 'spec_helper'

describe Train do

  subject { Train.new }

  context 'properties' do

    it 'should have a name' do
      subject.should respond_to(:name)
    end

  end

end
