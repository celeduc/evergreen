require 'spec_helper'

describe Evergreen::Suite do
  subject { Evergreen::Suite.new }

  describe '#get_spec' do
    subject { Evergreen::Suite.new.get_spec('testing_spec.js') }
    it 'has the correct name' do
      expect(subject.name).to eq 'testing_spec.js'
    end

    it 'should have the correct root' do
      expect(subject.root).to eq File.expand_path('suite1', File.dirname(__FILE__))
    end
  end

  describe '#specs' do
    it "should find all specs recursively in the given root directory" do
      subject.specs.map(&:name).should include('testing_spec.js', 'foo_spec.js', 'bar_spec.js', 'libs/lucid_spec.js', 'models/game_spec.js')
    end
  end

  describe '#templates' do
    it "should find all specs in the given root directory" do
      subject.templates.map(&:name).should include('one_template.html', 'another_template.html')
    end
  end

  describe '#spec_helpers' do
    it "should find all spec helpers in the given helpers directory" do
      subject.helpers.map(&:name).should include('spec_helper.js', 'spec_helper.coffee')
    end
  end
end
