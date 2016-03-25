defmodule StashTest do
  use ExUnit.Case
  alias TemperatureMonitor.Stash

  test "it can store and retrieve values" do
    assert Stash.get_value() == %{}
    Stash.save_value("abc123", 26.125)
    assert Stash.get_value() == %{"abc123" => 26.125}
  end
end
