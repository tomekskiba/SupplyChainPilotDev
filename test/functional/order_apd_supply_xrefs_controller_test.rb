require 'test_helper'

class OrderApdSupplyXrefsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => OrderApdSupplyXref.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    OrderApdSupplyXref.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    OrderApdSupplyXref.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to order_apd_supply_xref_url(assigns(:order_apd_supply_xref))
  end

  def test_edit
    get :edit, :id => OrderApdSupplyXref.first
    assert_template 'edit'
  end

  def test_update_invalid
    OrderApdSupplyXref.any_instance.stubs(:valid?).returns(false)
    put :update, :id => OrderApdSupplyXref.first
    assert_template 'edit'
  end

  def test_update_valid
    OrderApdSupplyXref.any_instance.stubs(:valid?).returns(true)
    put :update, :id => OrderApdSupplyXref.first
    assert_redirected_to order_apd_supply_xref_url(assigns(:order_apd_supply_xref))
  end

  def test_destroy
    order_apd_supply_xref = OrderApdSupplyXref.first
    delete :destroy, :id => order_apd_supply_xref
    assert_redirected_to order_apd_supply_xrefs_url
    assert !OrderApdSupplyXref.exists?(order_apd_supply_xref.id)
  end
end
