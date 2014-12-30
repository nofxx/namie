require 'spec_helper'

describe Namie::Parser do
  describe 'Simple name' do
    let(:parse) { Namie::Parser.new(['Jules Verne']) } # Jules Gabriel Verne

    it { parse.title.must_be_nil }
    it { parse.first.must_equal('Jules') }
    it { parse.middle.must_be_nil }
    it { parse.last.must_equal('Verne') }
  end
end
