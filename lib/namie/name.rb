module Namie
  # The Name!
  class Name
    attr_accessor :title, :first, :middle, :last, :suffix

    def initialize(*args)
      @title, @first, *@middle, @last, @suffix = Namie::Parser.new(args).args
    end

    def middle
      return nil if @middle.reject(&:nil?).empty?
      @middle.join(' ')
    end

    def surname
      "#{[title, last].join(' ')}, #{[first, middle, suffix].join(' ')}"
    end

    def valid?
      !first.empty?
    end

    def ==(other)
      fullname == other.fullname
    end

    def fullname
      to_s
    end

    def to_s(fmt = nil)
      Namie::Formatter.new(self, fmt).to_s
    end
  end
end
