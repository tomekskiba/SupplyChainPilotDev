require 'test_helper'

class UserAncillarySupplyXrefsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UserAncillarySupplyXref.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UserAncillarySupplyXref.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UserAncillarySupplyXref.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_ancillary_supply_xref_url(assigns(:user_ancillary_supply_xref))
  end

  def test_edit
    get :edit, :id => UserAncillarySupplyXref.first
    assert_template 'edit'
  end

  def test_update_invalid
    UserAncillarySupplyXref.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserAncillarySupplyXref.first
    assert_template 'edit'
  end

  def test_update_valid
    UserAncillarySupplyXref.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserAncillarySupplyXref.first
    assert_redirected_to user_ancillary_supply_xref_url(assigns(:user_ancillary_supply_xref))
  end

  def test_destroy
    user_ancillary_supply_xref = UserAncillarySupplyXref.first
    delete :destroy, :id => user_ancillary_supply_xref
    assert_redirected_to user_ancillary_supply_xrefs_url
    assert !UserAncillarySupplyXref.exists?(user_ancillary_supply_xref.id)
  end
end
