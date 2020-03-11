defmodule CachexTutorialTest do
  use ExUnit.Case
  doctest CachexTutorial

  test "greets the world" do
    assert CachexTutorial.hello() == :world
  end
end
