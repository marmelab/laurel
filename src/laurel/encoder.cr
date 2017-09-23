module Encoder
    extend self

    ALPHABET = "abcdefghijklmnopqrstuvwxyz "

    def encode(uncoded : String, shift : (Int32 | Int64))
        dictionary = create_shift_dictionary(shift)
        normalized_uncoded = normalize(uncoded)

        normalized_uncoded.tr(dictionary.keys.join, dictionary.values.join)
    end

    def decode(encoded : String, shift : (Int32 | Int64))
        dictionary = create_shift_dictionary(shift)

        encoded.tr(dictionary.values.join, dictionary.keys.join)
    end

    def create_shift_dictionary(shift : (Int32 | Int64))
        dictionary = {} of Char => Char
        
        ALPHABET.each_char_with_index do |c, index|
            dictionary[c] = ALPHABET[(index + shift) % ALPHABET.size]
        end

        dictionary
    end

    def normalize(unormalized : String)
        src = "ÀÁÂÃÄÅàáâãäåÒÓÔÕÖØòóôõöøÈÉÊËèéêëÇçÌÍÎÏìíîïÙÚÛÜùúûüÿÑñ"
        dst = "aaaaaaaaaaaaooooooooooooeeeeeeeecciiiiiiiiuuuuuuuuynn"

        unormalized.tr(src, dst).downcase
    end
end
