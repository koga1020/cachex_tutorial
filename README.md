# CachexTutorial

https://github.com/whitfin/cachex/ をサクッとお試しする環境

## セットアップ

```sh
$ cp .env.example .env
$ cp .envrc.example .envrc
# edit .encrc
$ vim .envrc
$ direnv allow
$ docker-compose up -d
$ mix ecto.migrate
```

## iexで動かす

1. insert seed data.
```sql
INSERT INTO
    people (first_name, last_name, age)
VALUES
    ('taro', 'yamada', 30),
    ('hanako', 'yamada', 20)
```

2. run iex.
```sh
$ iex -S mix
iex(1)> CachexTutorial.list_people()
# from Database.
20:44:38.359 [debug] QUERY OK source="people" db=16.3ms decode=0.9ms queue=3.0ms idle=1298.7ms
SELECT p0."id", p0."first_name", p0."last_name", p0."age" FROM "people" AS p0 []
[
  %CachexTutorial.Person{
    __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
    age: 20,
    first_name: "taro",
    id: 1,
    last_name: "yamada"
  },
  %CachexTutorial.Person{
    __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
    age: 30,
    first_name: "hanako",
    id: 2,
    last_name: "yamada"
  }
]
iex(2)> CachexTutorial.list_people()
# from cache.
[
  %CachexTutorial.Person{
    __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
    age: 20,
    first_name: "taro",
    id: 1,
    last_name: "yamada"
  },
  %CachexTutorial.Person{
    __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
    age: 30,
    first_name: "hanako",
    id: 2,
    last_name: "yamada"
  }
]
```