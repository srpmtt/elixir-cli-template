defmodule Utils do
  def clear() do
    case :os.type() do
      {:win32, _} ->
        {output, _exit_code} = System.cmd("cmd.exe", ["/c", "cls"])
        IO.puts(output)

      _ ->
        {output, _exit_code} = System.cmd("clear", [])
        IO.puts(output)
    end
  end

  def print_header do
    header = """
                            _ _ 
                           | (_)
       _ __ ___  _   _  ___| |_ 
      | '_ ` _ \\| | | |/ __| | |
      | | | | | | |_| | (__| | |
      |_| |_| |_|\\__, |\\___|_|_|
                  __/ |         
                 |___/
    """

    IO.puts(IO.ANSI.magenta() <> header <> IO.ANSI.reset())
  end

  def color(color, text) do
    c = get_color(color)
    IO.puts("#{c}#{text}#{IO.ANSI.reset()}")
  end

  defp get_color(:green), do: IO.ANSI.green()
  defp get_color(:red), do: IO.ANSI.red()
  defp get_color(:blue), do: IO.ANSI.blue()
  defp get_color(:yellow), do: IO.ANSI.yellow()
  defp get_color(:magenta), do: IO.ANSI.magenta()
  defp get_color(:cyan), do: IO.ANSI.cyan()
  defp get_color(color) when is_atom(color), do: IO.ANSI.reset()
end
