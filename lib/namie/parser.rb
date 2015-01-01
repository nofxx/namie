module Namie
  # Name parser
  class Parser
    TITLES = /^(Mister|Mr\.?|Ms\.?|Sir|Senhor|Dr\.?|Do[uc]tor|Sra?\.?|Senhora)\b/i
    JURIDIC = /\b(Ltd\.?|LTDA|Gmbh|LLC|S\/A)$/i
    SUFFIXES = /\b(#{JURIDIC}|Junior|Jr\.?|Neto|II|III)$/i
    attr_accessor :title, :first, :middle, :last, :suffix, :txt

    def initialize(params)
      hsh, txt = params.partition { |pm| pm.respond_to?(:key) }
      hsh.each { |k, v| send("#{k}=", v) }
      @txt = txt.map { |t| t.split(' ') }.flatten
      remove_non_names
      parse_name
      normalize
    end

    def parse_name
      @txt.push(@txt.shift.tr(',', '')) if txt.first  =~ /,/
      @first, *@middle, @last = txt.size > 2 ? txt : txt.insert(1, nil)
    end

    def remove_non_names
      @title, @txt = txt.partition { |a| a =~ TITLES }
      @suffix, @txt = txt.partition { |a| a =~ SUFFIXES }
    end

    def normalize
      [:title, :middle, :suffix].each do |v|
        val =  send(v).reject(&:nil?).any? ? send(v).join(' ') : nil
        instance_variable_set("@#{v}", val)
      end
    end

    def args
      [title, first, middle, last, suffix]
    end
  end
end
