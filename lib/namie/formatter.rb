module Namie
  # Format name
  class Formatter
    attr_accessor :out, :name, :format
    FORMATS = {
      default: '%t %f %m %l %s',
      airport: '%t %l, %f %m %s',
      strip: '%f %l'
    }

    ABBR = {
      t: :title,
      f: :first,
      m: :middle,
      l: :last,
      s: :suffix
    }

    def initialize(name, format)
      @name = name
      format ||= :default
      @format = format.is_a?(Symbol) ? FORMATS[format] : format
      @out = @format.dup
    end

    #
    # %t  Title
    # %f  First Name
    # %m  Middle Name(s)
    # %l  Last Name
    # %s  suffix
    #
    def to_s
      ABBR.each do |k, v|
        val = name.send(v)
        out.gsub!("%#{k}", val || '')
      end
      out.gsub(/\s{2,}/, ' ').strip.chomp
    end
  end
end
