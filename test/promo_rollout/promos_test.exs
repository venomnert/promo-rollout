defmodule PromoRollout.PromosTest do
  use PromoRollout.DataCase

  alias PromoRollout.Promos

  describe "promo_jobs" do
    alias PromoRollout.Promos.PromoJob

    @valid_attrs %{banners: %{}, draft: true, end_date: "2010-04-17T14:00:00Z", name: "some name", rolled_out: true, start_date: "2010-04-17T14:00:00Z", take_down: true}
    @update_attrs %{banners: %{}, draft: false, end_date: "2011-05-18T15:01:01Z", name: "some updated name", rolled_out: false, start_date: "2011-05-18T15:01:01Z", take_down: false}
    @invalid_attrs %{banners: nil, draft: nil, end_date: nil, name: nil, rolled_out: nil, start_date: nil, take_down: nil}

    def promo_job_fixture(attrs \\ %{}) do
      {:ok, promo_job} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Promos.create_promo_job()

      promo_job
    end

    test "list_promo_jobs/0 returns all promo_jobs" do
      promo_job = promo_job_fixture()
      assert Promos.list_promo_jobs() == [promo_job]
    end

    test "get_promo_job!/1 returns the promo_job with given id" do
      promo_job = promo_job_fixture()
      assert Promos.get_promo_job!(promo_job.id) == promo_job
    end

    test "create_promo_job/1 with valid data creates a promo_job" do
      assert {:ok, %PromoJob{} = promo_job} = Promos.create_promo_job(@valid_attrs)
      assert promo_job.banners == %{}
      assert promo_job.draft == true
      assert promo_job.end_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert promo_job.name == "some name"
      assert promo_job.rolled_out == true
      assert promo_job.start_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert promo_job.take_down == true
    end

    test "create_promo_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Promos.create_promo_job(@invalid_attrs)
    end

    test "update_promo_job/2 with valid data updates the promo_job" do
      promo_job = promo_job_fixture()
      assert {:ok, %PromoJob{} = promo_job} = Promos.update_promo_job(promo_job, @update_attrs)
      assert promo_job.banners == %{}
      assert promo_job.draft == false
      assert promo_job.end_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert promo_job.name == "some updated name"
      assert promo_job.rolled_out == false
      assert promo_job.start_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert promo_job.take_down == false
    end

    test "update_promo_job/2 with invalid data returns error changeset" do
      promo_job = promo_job_fixture()
      assert {:error, %Ecto.Changeset{}} = Promos.update_promo_job(promo_job, @invalid_attrs)
      assert promo_job == Promos.get_promo_job!(promo_job.id)
    end

    test "delete_promo_job/1 deletes the promo_job" do
      promo_job = promo_job_fixture()
      assert {:ok, %PromoJob{}} = Promos.delete_promo_job(promo_job)
      assert_raise Ecto.NoResultsError, fn -> Promos.get_promo_job!(promo_job.id) end
    end

    test "change_promo_job/1 returns a promo_job changeset" do
      promo_job = promo_job_fixture()
      assert %Ecto.Changeset{} = Promos.change_promo_job(promo_job)
    end
  end

  describe "landing_page_urls" do
    alias PromoRollout.Promos.LandingPageUrl

    @valid_attrs %{draft: true, end_date: "2010-04-17T14:00:00Z", redirected: true, url: "some url"}
    @update_attrs %{draft: false, end_date: "2011-05-18T15:01:01Z", redirected: false, url: "some updated url"}
    @invalid_attrs %{draft: nil, end_date: nil, redirected: nil, url: nil}

    def landing_page_url_fixture(attrs \\ %{}) do
      {:ok, landing_page_url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Promos.create_landing_page_url()

      landing_page_url
    end

    test "list_landing_page_urls/0 returns all landing_page_urls" do
      landing_page_url = landing_page_url_fixture()
      assert Promos.list_landing_page_urls() == [landing_page_url]
    end

    test "get_landing_page_url!/1 returns the landing_page_url with given id" do
      landing_page_url = landing_page_url_fixture()
      assert Promos.get_landing_page_url!(landing_page_url.id) == landing_page_url
    end

    test "create_landing_page_url/1 with valid data creates a landing_page_url" do
      assert {:ok, %LandingPageUrl{} = landing_page_url} = Promos.create_landing_page_url(@valid_attrs)
      assert landing_page_url.draft == true
      assert landing_page_url.end_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert landing_page_url.redirected == true
      assert landing_page_url.url == "some url"
    end

    test "create_landing_page_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Promos.create_landing_page_url(@invalid_attrs)
    end

    test "update_landing_page_url/2 with valid data updates the landing_page_url" do
      landing_page_url = landing_page_url_fixture()
      assert {:ok, %LandingPageUrl{} = landing_page_url} = Promos.update_landing_page_url(landing_page_url, @update_attrs)
      assert landing_page_url.draft == false
      assert landing_page_url.end_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert landing_page_url.redirected == false
      assert landing_page_url.url == "some updated url"
    end

    test "update_landing_page_url/2 with invalid data returns error changeset" do
      landing_page_url = landing_page_url_fixture()
      assert {:error, %Ecto.Changeset{}} = Promos.update_landing_page_url(landing_page_url, @invalid_attrs)
      assert landing_page_url == Promos.get_landing_page_url!(landing_page_url.id)
    end

    test "delete_landing_page_url/1 deletes the landing_page_url" do
      landing_page_url = landing_page_url_fixture()
      assert {:ok, %LandingPageUrl{}} = Promos.delete_landing_page_url(landing_page_url)
      assert_raise Ecto.NoResultsError, fn -> Promos.get_landing_page_url!(landing_page_url.id) end
    end

    test "change_landing_page_url/1 returns a landing_page_url changeset" do
      landing_page_url = landing_page_url_fixture()
      assert %Ecto.Changeset{} = Promos.change_landing_page_url(landing_page_url)
    end
  end
end
