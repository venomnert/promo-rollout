# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PromoRollout.Repo.insert!(%PromoRollout.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

regions = ["AU", "CA", "FR-CA", "NZ", "US"]

regions
|> Enum.each(fn region -> PromoRollout.Promos.create_region!(%{name: region}) end)
