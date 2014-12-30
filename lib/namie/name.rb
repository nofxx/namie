module Namie
  # The Name!
  class Name
    attr_accessor :title, :first, :middle, :last, :suffix

    def initialize(*args)
      @title, @first, *@middle, @last, @suffix = Namie::Parser.new(args).args
    end
    alias_method :firstname, :first
    alias_method :middlenames, :middle
    alias_method :lastname, :last

    def middle
      return nil if @middle.reject(&:nil?).empty?
      @middle.join(' ')
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

    def shortname
      to_s(:short)
    end

    def to_s(fmt = nil)
      Namie::Formatter.new(self, fmt).to_s
    end
  end
end
