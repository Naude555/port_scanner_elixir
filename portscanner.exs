defmodule PortScanner do
  def scan(target) do
    converted_ip = check_ip(target)
    IO.puts("[+] Scanning #{target}...")

    1..65535
    |> Task.async_stream(fn port -> scan_port(converted_ip, port) end, max_concurrency: 100)
    |> Enum.each(fn
      {:ok, result} -> result
      _ -> :ok
    end)
  end

  defp check_ip(ip) do
    case :inet.parse_address(to_charlist(ip)) do
      {:ok, _} -> ip
      _ -> resolve_hostname(ip)
    end
  end

  defp resolve_hostname(hostname) do
    case :inet.gethostbyname(to_charlist(hostname)) do
      {:ok, {:hostent, _, _, _, _, [address | _]}} -> :inet.ntoa(address) |> to_string()
      _ -> raise "Unable to resolve hostname: #{hostname}"
    end
  end

  defp get_banner(socket) do
    case :gen_tcp.recv(socket, 1024, 500) do
      {:ok, banner} -> banner
      _ -> nil
    end
  end

  defp scan_port(ip, port) do
    case :gen_tcp.connect(to_charlist(ip), port, [:binary, active: false, packet: :raw], 500) do
      {:ok, socket} ->
        banner = get_banner(socket)
        :gen_tcp.close(socket)

        if banner do
          IO.puts("[+] Open Port #{port}: #{String.trim(banner)}.")
        else
          IO.puts("[+] Open Port #{port} - No banner available.")
        end

      _ ->
        :ok
    end
  end
end

# Main entry point
defmodule Main do
  def run do
    targets = IO.gets("[+] Enter Target/s To scan (split multiple targets with ,): ")
    |> String.trim()

    case targets do
      "" ->
        IO.puts("[!] No targets provided. Exiting.")
        :ok

      _ ->
        targets
        |> String.split(",")
        |> Enum.map(&String.trim/1)
        |> Enum.each(&PortScanner.scan/1)
    end
  end
end

Main.run()
