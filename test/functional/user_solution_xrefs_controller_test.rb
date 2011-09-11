require 'test_helper'

class UserSolutionXrefsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UserSolutionXref.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UserSolutionXref.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UserSolutionXref.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_solution_xref_url(assigns(:user_solution_xref))
  end

  def test_edit
    get :edit, :id => UserSolutionXref.first
    assert_template 'edit'
  end

  def test_update_invalid
    UserSolutionXref.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserSolutionXref.first
    assert_template 'edit'
  end

  def test_update_valid
    UserSolutionXref.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserSolutionXref.first
    assert_redirected_to user_solution_xref_url(assigns(:user_solution_xref))
  end

  def test_destroy
    user_solution_xref = UserSolutionXref.first
    delete :destroy, :id => user_solution_xref
    assert_redirected_to user_solution_xrefs_url
    assert !UserSolutionXref.exists?(user_solution_xref.id)
  end
end
