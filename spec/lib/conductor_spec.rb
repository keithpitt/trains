require 'spec_helper'

describe Conductor do

  subject { Conductor.new }

  context 'properties' do

    it 'should have a trains array' do
      subject.trains.should be_kind_of(Array)
    end

    it 'should have a routes array' do
      subject.routes.should be_kind_of(Array)
    end

  end

end
