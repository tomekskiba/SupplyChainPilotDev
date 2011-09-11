require 'test_helper'

class AncillarySuppliesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => AncillarySupply.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    AncillarySupply.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    AncillarySupply.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ancillary_supply_url(assigns(:ancillary_supply))
  end

  def test_edit
    get :edit, :id => AncillarySupply.first
    assert_template 'edit'
  end

  def test_update_invalid
    AncillarySupply.any_instance.stubs(:valid?).returns(false)
    put :update, :id => AncillarySupply.first
    assert_template 'edit'
  end

  def test_update_valid
    AncillarySupply.any_instance.stubs(:valid?).returns(true)
    put :update, :id => AncillarySupply.first
    assert_redirected_to ancillary_supply_url(assigns(:ancillary_supply))
  end

  def test_destroy
    ancillary_supply = AncillarySupply.first
    delete :destroy, :id => ancillary_supply
    assert_redirected_to ancillary_supplies_url
    assert !AncillarySupply.exists?(ancillary_supply.id)
  end
end
