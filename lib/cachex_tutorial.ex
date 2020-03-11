defmodule CachexTutorial do
  def list_people() do
    Cachex.get!(:my_cache, :people)
    |> case do
      nil ->
        people = CachexTutorial.DB.list_people()

        Cachex.put(:my_cache, :people, people)

        people

      people ->
        people
    end
  end
end
