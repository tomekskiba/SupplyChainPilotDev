require 'test_helper'

class OrderSolutionXrefsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => OrderSolutionXref.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    OrderSolutionXref.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    OrderSolutionXref.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to order_solution_xref_url(assigns(:order_solution_xref))
  end

  def test_edit
    get :edit, :id => OrderSolutionXref.first
    assert_template 'edit'
  end

  def test_update_invalid
    OrderSolutionXref.any_instance.stubs(:valid?).returns(false)
    put :update, :id => OrderSolutionXref.first
    assert_template 'edit'
  end

  def test_update_valid
    OrderSolutionXref.any_instance.stubs(:valid?).returns(true)
    put :update, :id => OrderSolutionXref.first
    assert_redirected_to order_solution_xref_url(assigns(:order_solution_xref))
  end

  def test_destroy
    order_solution_xref = OrderSolutionXref.first
    delete :destroy, :id => order_solution_xref
    assert_redirected_to order_solution_xrefs_url
    assert !OrderSolutionXref.exists?(order_solution_xref.id)
  end
end
