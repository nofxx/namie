require 'spec_helper'

describe Namie::Name do
  it 'should instantiate' do
    Namie::Name.new('Isaac Asimov').must_be_instance_of(Namie::Name)
  end

  it 'should accept middle names' do
    Namie::Name.new('John Edgard Smith').valid?.must_equal(true)
  end

  it 'should abbr middle names' do
    Namie::Name.new('George S. Patton').must_be_instance_of(Namie::Name)
  end

  it 'should respond to alias method firstname' do
    Namie::Name.new('Isaac Asimov').first.must_equal('Isaac')
  end

  it 'should respond to alias method lastname' do
    Namie::Name.new('George S. Patton').lastname.must_equal('Patton')
  end

  it 'should calculate an alias' do
    Namie::Name.new('Ian "Lenny" Kilmister').aka.must_equal('Lenny')
  end

  it 'should calculate an alias' do
    Namie::Name.new('S. Dumont').aka.must_be_nil
  end

  describe 'Simple name' do
    let(:nam) { Namie::Name.new('Jules Verne') } # Jules Gabriel Verne

    it { nam.title.must_be_nil }
    it { nam.first.must_equal('Jules') }
    it { nam.middle.must_be_nil }
    it { nam.last.must_equal('Verne') }
    it { nam.fullname.must_equal('Jules Verne') }
  end

  describe 'Simple name' do
    let(:nam) { Namie::Name.new('Douglas Adams') } # Jules Gabriel Verne

    it { nam.first.must_equal('Douglas') }
    it { nam.middle.must_be_nil }
    it { nam.last.must_equal('Adams') }
  end

  describe 'Name with middle name' do
    let(:nam) { Namie::Name.new('Alberto Santos Dumont') }

    it { nam.title.must_be_nil }
    it { nam.first.must_equal('Alberto') }
    it { nam.middle.must_equal('Santos') }
    it { nam.last.must_equal('Dumont') }
    it { nam.suffix.must_be_nil }
    it { nam.fullname.must_equal('Alberto Santos Dumont') }
  end

  describe 'Name with abbr middle name' do
    let(:nam) { Namie::Name.new('Arthur C. Clark') }

    it { nam.title.must_be_nil }
    it { nam.first.must_equal('Arthur') }
    it { nam.middle.must_equal('C.') }
    it { nam.last.must_equal('Clark') }
    it { nam.suffix.must_be_nil }
  end

  describe 'Name with lots of middle names' do
    let(:nam) { Namie::Name.new('Isabel Cristina Leopoldina Augusta Micaela Gabriela Rafaela Gonzaga de Bragança e Bourbon') } # rubocop:disable Metrics/LineLength

    it { nam.title.must_be_nil }
    it { nam.first.must_equal('Isabel') }
    it { nam.middle.size.must_equal(74) }
    it { nam.last.must_equal('Bourbon') }
    it { nam.suffix.must_be_nil }
  end

  describe 'Name with title' do
    let(:nam) { Namie::Name.new('Sir Arthur C. Clark') }

    it { nam.title.must_equal('Sir') }
    it { nam.first.must_equal('Arthur') }
    it { nam.middle.must_equal('C.') }
    it { nam.last.must_equal('Clark') }
    it { nam.fullname.must_equal('Sir Arthur C. Clark') }
  end

  describe 'Name with suffix' do
    let(:nam) { Namie::Name.new('José Maria Jr.') }

    it { nam.first.must_equal('José') }
    it { nam.middle.must_be_nil }
    it { nam.last.must_equal('Maria') }
    it { nam.fullname.must_equal('José Maria Jr.') }
    it { nam.suffix.must_equal('Jr.') }
  end

  describe 'Name with suffix' do
    let(:nam) { Namie::Name.new('José Maria Neto') }

    it { nam.first.must_equal('José') }
    it { nam.middle.must_be_nil }
    it { nam.last.must_equal('Maria') }
    it { nam.fullname.must_equal('José Maria Neto') }
    it { nam.suffix.must_equal('Neto') }
  end

  describe 'Company name with suffix' do
    let(:nam) { Namie::Name.new('ACME Enterprises Ltd.') }

    it { nam.first.must_equal('ACME') }
    it { nam.middle.must_be_nil }
    it { nam.last.must_equal('Enterprises') }
    it { nam.fullname.must_equal('ACME Enterprises Ltd.') }
    it { nam.suffix.must_equal('Ltd.') }
  end

  describe 'Company name with suffix' do
    let(:nam) { Namie::Name.new('ACME Enterprises Ltda') }

    it { nam.first.must_equal('ACME') }
    it { nam.middle.must_be_nil }
    it { nam.last.must_equal('Enterprises') }
    it { nam.fullname.must_equal('ACME Enterprises Ltda') }
    it { nam.suffix.must_equal('Ltda') }
    it { nam.to_s('%f - %l').must_equal('ACME - Enterprises') }
  end

  describe 'Name with nickname style' do
    let(:nam) { Namie::Name.new('Ian Fraser "Lemmy" Kilmister') }

    it { nam.title.must_be_nil }
    it { nam.first.must_equal('Ian') }
    it { nam.middle.must_equal('Fraser "Lemmy"') }
    it { nam.last.must_equal('Kilmister') }
    it { nam.fullname.must_equal('Ian Fraser "Lemmy" Kilmister') }
    it { nam.suffix.must_be_nil }
  end

  describe 'Name aiport style' do
    let(:nam) { Namie::Name.new('Hendrix, Jimmi') }

    it { nam.title.must_be_nil }
    it { nam.first.must_equal('Jimmi') }
    it { nam.middle.must_be_nil }
    it { nam.last.must_equal('Hendrix') }
    it { nam.fullname.must_equal('Jimmi Hendrix') }
    it { nam.suffix.must_be_nil }
    it { nam.to_s(:airport).must_equal('Hendrix, Jimmi') }
  end

  describe 'Name aiport style' do
    let(:nam) { Namie::Name.new('Hendrix, Jimmi') }

    it { nam.title.must_be_nil }
    it { nam.first.must_equal('Jimmi') }
    it { nam.middle.must_be_nil }
    it { nam.last.must_equal('Hendrix') }
    it { nam.fullname.must_equal('Jimmi Hendrix') }
    it { nam.suffix.must_be_nil }
    it { nam.to_s(:airport).must_equal('Hendrix, Jimmi') }
  end
end
