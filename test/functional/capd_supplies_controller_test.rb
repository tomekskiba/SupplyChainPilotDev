require 'test_helper'

class CapdSuppliesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => CapdSupply.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    CapdSupply.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    CapdSupply.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to capd_supply_url(assigns(:capd_supply))
  end

  def test_edit
    get :edit, :id => CapdSupply.first
    assert_template 'edit'
  end

  def test_update_invalid
    CapdSupply.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CapdSupply.first
    assert_template 'edit'
  end

  def test_update_valid
    CapdSupply.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CapdSupply.first
    assert_redirected_to capd_supply_url(assigns(:capd_supply))
  end

  def test_destroy
    capd_supply = CapdSupply.first
    delete :destroy, :id => capd_supply
    assert_redirected_to capd_supplies_url
    assert !CapdSupply.exists?(capd_supply.id)
  end
end
