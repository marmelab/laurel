require "spec"
require "../src/laurel/encoder"

describe "Encoder" do
    describe "encode" do
        it "should return encoded string with the corresponding shift" do
            Encoder.encode("hello", 3).should eq("khoor")
        end
    end

    describe "decode" do
        it "should return decoded string with the corresponding shift" do
            Encoder.decode("khoor", 3).should eq("hello")
        end
    end

    describe "create_shift_dictionary" do
        it "should return a Hash with shifted letters from alphabet" do
            shift_dictionary = Encoder.create_shift_dictionary(3)
    
            shift_dictionary.keys.join.should eq("abcdefghijklmnopqrstuvwxyz ")
            shift_dictionary.values.join.should eq("defghijklmnopqrstuvwxyz abc")
        end
    end

    describe "normalize" do
        it "should replace non alphanumeric letters with corresponding alphanumeric letters" do
            Encoder.normalize("hé ça va ?").should eq("he ca va ?")
        end

        it "should downcase all upcased letters" do
            Encoder.normalize("HeLlo").should eq("hello")
        end
    end
end
