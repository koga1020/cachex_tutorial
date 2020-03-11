defmodule CachexTutorial.DB do
  alias CachexTutorial.Repo

  def list_people() do
    Repo.all(CachexTutorial.Person)
  end
end
