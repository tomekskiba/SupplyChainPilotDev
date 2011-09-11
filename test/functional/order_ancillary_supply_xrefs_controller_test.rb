require 'test_helper'

class OrderAncillarySupplyXrefsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => OrderAncillarySupplyXref.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    OrderAncillarySupplyXref.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    OrderAncillarySupplyXref.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to order_ancillary_supply_xref_url(assigns(:order_ancillary_supply_xref))
  end

  def test_edit
    get :edit, :id => OrderAncillarySupplyXref.first
    assert_template 'edit'
  end

  def test_update_invalid
    OrderAncillarySupplyXref.any_instance.stubs(:valid?).returns(false)
    put :update, :id => OrderAncillarySupplyXref.first
    assert_template 'edit'
  end

  def test_update_valid
    OrderAncillarySupplyXref.any_instance.stubs(:valid?).returns(true)
    put :update, :id => OrderAncillarySupplyXref.first
    assert_redirected_to order_ancillary_supply_xref_url(assigns(:order_ancillary_supply_xref))
  end

  def test_destroy
    order_ancillary_supply_xref = OrderAncillarySupplyXref.first
    delete :destroy, :id => order_ancillary_supply_xref
    assert_redirected_to order_ancillary_supply_xrefs_url
    assert !OrderAncillarySupplyXref.exists?(order_ancillary_supply_xref.id)
  end
end
