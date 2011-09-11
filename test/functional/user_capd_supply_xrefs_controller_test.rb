require 'test_helper'

class UserCapdSupplyXrefsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UserCapdSupplyXref.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UserCapdSupplyXref.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UserCapdSupplyXref.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_capd_supply_xref_url(assigns(:user_capd_supply_xref))
  end

  def test_edit
    get :edit, :id => UserCapdSupplyXref.first
    assert_template 'edit'
  end

  def test_update_invalid
    UserCapdSupplyXref.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserCapdSupplyXref.first
    assert_template 'edit'
  end

  def test_update_valid
    UserCapdSupplyXref.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserCapdSupplyXref.first
    assert_redirected_to user_capd_supply_xref_url(assigns(:user_capd_supply_xref))
  end

  def test_destroy
    user_capd_supply_xref = UserCapdSupplyXref.first
    delete :destroy, :id => user_capd_supply_xref
    assert_redirected_to user_capd_supply_xrefs_url
    assert !UserCapdSupplyXref.exists?(user_capd_supply_xref.id)
  end
end
