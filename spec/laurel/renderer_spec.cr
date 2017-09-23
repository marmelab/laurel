require "spec"
require "../src/laurel/renderer"

describe "Renderer" do
    describe "render" do
        it "should output string with nested angles ahead with String arg" do
            Renderer.render("foo").should eq(">> foo")
        end

        it "should output a list of strings nested angles ahead for :count > 0 with Array(NamedTuple) arg" do
            Renderer.render([
                { key: "foo", count: 1 },
                { key: "bar", count: 0 }
            ]).should eq(<<-OUTPUT

              >> foo
                 bar


            OUTPUT)
        end
    end
end
