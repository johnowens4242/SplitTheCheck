require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should get willSplit" do
    get restaurants_will_split_path(@restaurant)

    assert_redirected_to restaurants_url
  end

  test "should get willNotSplit" do
    get restaurants_will_not_split_path(@restaurant)

    assert_redirected_to restaurants_url
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { countWillNotSplit: @restaurant.countWillNotSplit, countWillSplit: @restaurant.countWillSplit, location: @restaurant.location, name: @restaurant.name } }
    end

    assert_redirected_to restaurants_url
  end

  #test "should show restaurant" do
  #  get restaurant_url(@restaurant)
  #  assert_response :success
  #end

  #test "should get edit" do
  #  get edit_restaurant_url(@restaurant)
  #  assert_response :success
  #end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { countWillNotSplit: @restaurant.countWillNotSplit, countWillSplit: @restaurant.countWillSplit, location: @restaurant.location, name: @restaurant.name } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  #test "should destroy restaurant" do
  #  assert_difference('Restaurant.count', -1) do
  #    delete restaurant_url(@restaurant)
  #  end
#
#    assert_redirected_to restaurants_url
#  end
end
