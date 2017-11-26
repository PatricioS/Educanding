require 'test_helper'

class QuestioncommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @questioncomment = questioncomments(:one)
  end

  test "should get index" do
    get questioncomments_url
    assert_response :success
  end

  test "should get new" do
    get new_questioncomment_url
    assert_response :success
  end

  test "should create questioncomment" do
    assert_difference('Questioncomment.count') do
      post questioncomments_url, params: { questioncomment: { question_id: @questioncomment.question_id, texto: @questioncomment.texto, user_id: @questioncomment.user_id } }
    end

    assert_redirected_to questioncomment_url(Questioncomment.last)
  end

  test "should show questioncomment" do
    get questioncomment_url(@questioncomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_questioncomment_url(@questioncomment)
    assert_response :success
  end

  test "should update questioncomment" do
    patch questioncomment_url(@questioncomment), params: { questioncomment: { question_id: @questioncomment.question_id, texto: @questioncomment.texto, user_id: @questioncomment.user_id } }
    assert_redirected_to questioncomment_url(@questioncomment)
  end

  test "should destroy questioncomment" do
    assert_difference('Questioncomment.count', -1) do
      delete questioncomment_url(@questioncomment)
    end

    assert_redirected_to questioncomments_url
  end
end
