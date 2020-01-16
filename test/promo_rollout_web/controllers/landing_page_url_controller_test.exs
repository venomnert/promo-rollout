defmodule PromoRolloutWeb.LandingPageUrlControllerTest do
  use PromoRolloutWeb.ConnCase

  alias PromoRollout.Promos

  @create_attrs %{draft: true, end_date: "2010-04-17T14:00:00Z", redirected: true, url: "some url"}
  @update_attrs %{draft: false, end_date: "2011-05-18T15:01:01Z", redirected: false, url: "some updated url"}
  @invalid_attrs %{draft: nil, end_date: nil, redirected: nil, url: nil}

  def fixture(:landing_page_url) do
    {:ok, landing_page_url} = Promos.create_landing_page_url(@create_attrs)
    landing_page_url
  end

  describe "index" do
    test "lists all landing_page_urls", %{conn: conn} do
      conn = get(conn, Routes.landing_page_url_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Landing page urls"
    end
  end

  describe "new landing_page_url" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.landing_page_url_path(conn, :new))
      assert html_response(conn, 200) =~ "New Landing page url"
    end
  end

  describe "create landing_page_url" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.landing_page_url_path(conn, :create), landing_page_url: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.landing_page_url_path(conn, :show, id)

      conn = get(conn, Routes.landing_page_url_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Landing page url"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.landing_page_url_path(conn, :create), landing_page_url: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Landing page url"
    end
  end

  describe "edit landing_page_url" do
    setup [:create_landing_page_url]

    test "renders form for editing chosen landing_page_url", %{conn: conn, landing_page_url: landing_page_url} do
      conn = get(conn, Routes.landing_page_url_path(conn, :edit, landing_page_url))
      assert html_response(conn, 200) =~ "Edit Landing page url"
    end
  end

  describe "update landing_page_url" do
    setup [:create_landing_page_url]

    test "redirects when data is valid", %{conn: conn, landing_page_url: landing_page_url} do
      conn = put(conn, Routes.landing_page_url_path(conn, :update, landing_page_url), landing_page_url: @update_attrs)
      assert redirected_to(conn) == Routes.landing_page_url_path(conn, :show, landing_page_url)

      conn = get(conn, Routes.landing_page_url_path(conn, :show, landing_page_url))
      assert html_response(conn, 200) =~ "some updated url"
    end

    test "renders errors when data is invalid", %{conn: conn, landing_page_url: landing_page_url} do
      conn = put(conn, Routes.landing_page_url_path(conn, :update, landing_page_url), landing_page_url: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Landing page url"
    end
  end

  describe "delete landing_page_url" do
    setup [:create_landing_page_url]

    test "deletes chosen landing_page_url", %{conn: conn, landing_page_url: landing_page_url} do
      conn = delete(conn, Routes.landing_page_url_path(conn, :delete, landing_page_url))
      assert redirected_to(conn) == Routes.landing_page_url_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.landing_page_url_path(conn, :show, landing_page_url))
      end
    end
  end

  defp create_landing_page_url(_) do
    landing_page_url = fixture(:landing_page_url)
    {:ok, landing_page_url: landing_page_url}
  end
end
