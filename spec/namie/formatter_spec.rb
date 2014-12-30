require 'spec_helper'

describe Namie::Parser do
  describe 'Simple name' do
    let(:parse) { Namie::Name.new('Jules Verne') } # Jules Gabriel Verne

    it 'should have a nice #to_s' do
      parse.to_s.must_equal('Jules Verne')
    end

    it 'should have a nice #to_s(:symbol)' do
      parse.to_s(:airport).must_equal('Verne, Jules')
    end
  end
end
