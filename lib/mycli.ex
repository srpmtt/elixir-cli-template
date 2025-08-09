defmodule MyCLI do
  def main(args) do
    Utils.clear()
    Utils.print_header()

    case args do
      ["hello", name] ->
        Hello.run(name)

      _ ->
        raise InvalidCommandError
    end
  end
end
