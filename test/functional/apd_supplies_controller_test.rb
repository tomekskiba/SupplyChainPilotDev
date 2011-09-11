require 'test_helper'

class ApdSuppliesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ApdSupply.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ApdSupply.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ApdSupply.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to apd_supply_url(assigns(:apd_supply))
  end

  def test_edit
    get :edit, :id => ApdSupply.first
    assert_template 'edit'
  end

  def test_update_invalid
    ApdSupply.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ApdSupply.first
    assert_template 'edit'
  end

  def test_update_valid
    ApdSupply.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ApdSupply.first
    assert_redirected_to apd_supply_url(assigns(:apd_supply))
  end

  def test_destroy
    apd_supply = ApdSupply.first
    delete :destroy, :id => apd_supply
    assert_redirected_to apd_supplies_url
    assert !ApdSupply.exists?(apd_supply.id)
  end
end
