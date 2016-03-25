defmodule TemperatureMonitor.Stash do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def save_value(pid \\ __MODULE__, serial_number, value) do
    GenServer.cast pid, {:save_value, serial_number, value}
  end

  def get_value(pid \\ __MODULE__) do
    GenServer.call pid, :get_value
  end

  def handle_call(:get_value, _from, values) do
    {:reply, values, values}
  end

  def handle_cast({:save_value, serial_number, value}, values) do
    {:noreply, Map.put(values, serial_number, value)}
  end
end
