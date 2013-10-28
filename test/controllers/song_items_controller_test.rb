require 'test_helper'

class SongItemsControllerTest < ActionController::TestCase
  setup do
    @song_item = song_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:song_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song_item" do
    assert_difference('SongItem.count') do
      post :create, song_item: { album: @song_item.album, artist: @song_item.artist, genre: @song_item.genre, path: @song_item.path, title: @song_item.title }
    end

    assert_redirected_to song_item_path(assigns(:song_item))
  end

  test "should show song_item" do
    get :show, id: @song_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song_item
    assert_response :success
  end

  test "should update song_item" do
    patch :update, id: @song_item, song_item: { album: @song_item.album, artist: @song_item.artist, genre: @song_item.genre, path: @song_item.path, title: @song_item.title }
    assert_redirected_to song_item_path(assigns(:song_item))
  end

  test "should destroy song_item" do
    assert_difference('SongItem.count', -1) do
      delete :destroy, id: @song_item
    end

    assert_redirected_to song_items_path
  end
end
