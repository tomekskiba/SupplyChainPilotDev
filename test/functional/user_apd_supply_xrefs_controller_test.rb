require 'test_helper'

class UserApdSupplyXrefsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UserApdSupplyXref.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UserApdSupplyXref.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UserApdSupplyXref.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_apd_supply_xref_url(assigns(:user_apd_supply_xref))
  end

  def test_edit
    get :edit, :id => UserApdSupplyXref.first
    assert_template 'edit'
  end

  def test_update_invalid
    UserApdSupplyXref.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserApdSupplyXref.first
    assert_template 'edit'
  end

  def test_update_valid
    UserApdSupplyXref.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserApdSupplyXref.first
    assert_redirected_to user_apd_supply_xref_url(assigns(:user_apd_supply_xref))
  end

  def test_destroy
    user_apd_supply_xref = UserApdSupplyXref.first
    delete :destroy, :id => user_apd_supply_xref
    assert_redirected_to user_apd_supply_xrefs_url
    assert !UserApdSupplyXref.exists?(user_apd_supply_xref.id)
  end
end
