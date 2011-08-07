require 'spec_helper'

describe Conductor do

  subject { Conductor.new }

  context 'properties' do

    it 'should have a places array' do
      subject.places.should be_kind_of(Array)
    end

    it 'should have a routes array' do
      subject.routes.should be_kind_of(Array)
    end

  end

end
