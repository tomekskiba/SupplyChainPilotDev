require 'test_helper'

class OrderCapdSupplyXrefsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => OrderCapdSupplyXref.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    OrderCapdSupplyXref.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    OrderCapdSupplyXref.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to order_capd_supply_xref_url(assigns(:order_capd_supply_xref))
  end

  def test_edit
    get :edit, :id => OrderCapdSupplyXref.first
    assert_template 'edit'
  end

  def test_update_invalid
    OrderCapdSupplyXref.any_instance.stubs(:valid?).returns(false)
    put :update, :id => OrderCapdSupplyXref.first
    assert_template 'edit'
  end

  def test_update_valid
    OrderCapdSupplyXref.any_instance.stubs(:valid?).returns(true)
    put :update, :id => OrderCapdSupplyXref.first
    assert_redirected_to order_capd_supply_xref_url(assigns(:order_capd_supply_xref))
  end

  def test_destroy
    order_capd_supply_xref = OrderCapdSupplyXref.first
    delete :destroy, :id => order_capd_supply_xref
    assert_redirected_to order_capd_supply_xrefs_url
    assert !OrderCapdSupplyXref.exists?(order_capd_supply_xref.id)
  end
end
