module Renderer
    extend self

    def render(result : Array({ key: String, count: Int32 }))  
        formated_palmares = result.map do |palmares|
            "#{palmares[:count] > 0 ? (">>") : ("  ")} #{palmares[:key]}"
        end

        "\n  " + formated_palmares.join("\n  ") + "\n\n"
    end

    def render(result : String)
        ">> #{result}"
    end
end
