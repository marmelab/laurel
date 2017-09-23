require "commander"
require "./laurel/*"

def shift_flag_assign(flag : Commander::Flag)
    flag.name = "shift"
    flag.short = "-s"
    flag.long = "--shift"
    flag.default = 3
    flag.description = "The number of characters to shift"
end

cli = Commander::Command.new do |cmd|
    cmd.use = "laurel"
    cmd.long = "laurel is a CLI tool which achieve Caesar Cipher manipulations"

    cmd.commands.add do |cmd|
        cmd.use = "encode <string>"
        cmd.short = "Encode string with shift flag value (default 3)"
        cmd.long = cmd.short

        cmd.flags.add do |flag|
            shift_flag_assign(flag)
        end

        cmd.run do |options, arguments|
            result = Encoder.encode(arguments[0], options.int["shift"])
            puts Renderer.render(result)
        end
    end

    cmd.commands.add do |cmd|
        cmd.use = "decode <string>"
        cmd.short = "decode string with shift flag value (default 3)"
        cmd.long = cmd.short

        cmd.flags.add do |flag|
            shift_flag_assign(flag)
        end

        cmd.run do |options, arguments|
            result = Encoder.decode(arguments[0], options.int["shift"])
            puts Renderer.render(result)
        end
    end

    cmd.commands.add do |cmd|
        cmd.use = "infer <string>"
        cmd.short = "Infer string value from a dictionnary of usual terms"
        cmd.long = cmd.short
        
        cmd.flags.add do |flag|
            flag.name = "dict"
            flag.short = "-d"
            flag.long = "--dict"
            flag.default = ""
            flag.description = "Dictionary file path"
        end

        cmd.run do |options, arguments|
            if options.string["dict"] == ""
                dictionary = Array(String).new
            else
                dictionary = File.read_lines(options.string["dict"])
            end
            
            result = Inferer.infer(arguments[0], dictionary)
            puts Renderer.render(result)
        end
    end

    cmd.run do |options, arguments|
        puts cmd.help
    end
end

Commander.run(cli, ARGV)
