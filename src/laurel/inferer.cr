module Inferer
    extend self

    def infer(encoded : String, dictionary : Array(String))
        candidates = [] of { key: String, count: Int32 }

        (1...Encoder::ALPHABET.size).each do |shift|
            decoded = Encoder.decode(encoded, shift)
            candidates << { key: decoded, count: ((decoded.split(' ') - [""]) & dictionary).size }
        end

        candidates
    end
end
