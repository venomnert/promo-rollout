defmodule PromoRolloutWeb.PromoJobControllerTest do
  use PromoRolloutWeb.ConnCase

  alias PromoRollout.Promos

  @create_attrs %{banners: %{}, draft: true, end_date: "2010-04-17T14:00:00Z", name: "some name", rolled_out: true, start_date: "2010-04-17T14:00:00Z", take_down: true}
  @update_attrs %{banners: %{}, draft: false, end_date: "2011-05-18T15:01:01Z", name: "some updated name", rolled_out: false, start_date: "2011-05-18T15:01:01Z", take_down: false}
  @invalid_attrs %{banners: nil, draft: nil, end_date: nil, name: nil, rolled_out: nil, start_date: nil, take_down: nil}

  def fixture(:promo_job) do
    {:ok, promo_job} = Promos.create_promo_job(@create_attrs)
    promo_job
  end

  describe "index" do
    test "lists all promo_jobs", %{conn: conn} do
      conn = get(conn, Routes.promo_job_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Promo jobs"
    end
  end

  describe "new promo_job" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.promo_job_path(conn, :new))
      assert html_response(conn, 200) =~ "New Promo job"
    end
  end

  describe "create promo_job" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.promo_job_path(conn, :create), promo_job: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.promo_job_path(conn, :show, id)

      conn = get(conn, Routes.promo_job_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Promo job"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.promo_job_path(conn, :create), promo_job: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Promo job"
    end
  end

  describe "edit promo_job" do
    setup [:create_promo_job]

    test "renders form for editing chosen promo_job", %{conn: conn, promo_job: promo_job} do
      conn = get(conn, Routes.promo_job_path(conn, :edit, promo_job))
      assert html_response(conn, 200) =~ "Edit Promo job"
    end
  end

  describe "update promo_job" do
    setup [:create_promo_job]

    test "redirects when data is valid", %{conn: conn, promo_job: promo_job} do
      conn = put(conn, Routes.promo_job_path(conn, :update, promo_job), promo_job: @update_attrs)
      assert redirected_to(conn) == Routes.promo_job_path(conn, :show, promo_job)

      conn = get(conn, Routes.promo_job_path(conn, :show, promo_job))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, promo_job: promo_job} do
      conn = put(conn, Routes.promo_job_path(conn, :update, promo_job), promo_job: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Promo job"
    end
  end

  describe "delete promo_job" do
    setup [:create_promo_job]

    test "deletes chosen promo_job", %{conn: conn, promo_job: promo_job} do
      conn = delete(conn, Routes.promo_job_path(conn, :delete, promo_job))
      assert redirected_to(conn) == Routes.promo_job_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.promo_job_path(conn, :show, promo_job))
      end
    end
  end

  defp create_promo_job(_) do
    promo_job = fixture(:promo_job)
    {:ok, promo_job: promo_job}
  end
end
