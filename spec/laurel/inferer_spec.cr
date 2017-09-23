require "spec"
require "../src/laurel/inferer"

describe "Inferer" do
    describe "infer" do
        it "should return an array of NamedTuples with decoded text and dictionary count" do
            Inferer.infer("khoor", ["hello", "world"]).should eq([
                {key: "jgnnq", count: 0},
                {key: "ifmmp", count: 0},
                {key: "hello", count: 1},
                {key: "gdkkn", count: 0},
                {key: "fcjjm", count: 0},
                {key: "ebiil", count: 0},
                {key: "dahhk", count: 0},
                {key: "c ggj", count: 0},
                {key: "bzffi", count: 0},
                {key: "ayeeh", count: 0},
                {key: " xddg", count: 0},
                {key: "zwccf", count: 0},
                {key: "yvbbe", count: 0},
                {key: "xuaad", count: 0},
                {key: "wt  c", count: 0},
                {key: "vszzb", count: 0},
                {key: "uryya", count: 0},
                {key: "tqxx ", count: 0},
                {key: "spwwz", count: 0},
                {key: "rovvy", count: 0},
                {key: "qnuux", count: 0},
                {key: "pmttw", count: 0},
                {key: "olssv", count: 0},
                {key: "nkrru", count: 0},
                {key: "mjqqt", count: 0},
                {key: "lipps", count: 0}
            ])
        end
    end
end
