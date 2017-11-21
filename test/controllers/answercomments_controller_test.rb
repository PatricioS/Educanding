require 'test_helper'

class AnswercommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answercomment = answercomments(:one)
  end

  test "should get index" do
    get answercomments_url
    assert_response :success
  end

  test "should get new" do
    get new_answercomment_url
    assert_response :success
  end

  test "should create answercomment" do
    assert_difference('Answercomment.count') do
      post answercomments_url, params: { answercomment: { answer_id: @answercomment.answer_id, texto: @answercomment.texto, user_id: @answercomment.user_id } }
    end

    assert_redirected_to answercomment_url(Answercomment.last)
  end

  test "should show answercomment" do
    get answercomment_url(@answercomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_answercomment_url(@answercomment)
    assert_response :success
  end

  test "should update answercomment" do
    patch answercomment_url(@answercomment), params: { answercomment: { answer_id: @answercomment.answer_id, texto: @answercomment.texto, user_id: @answercomment.user_id } }
    assert_redirected_to answercomment_url(@answercomment)
  end

  test "should destroy answercomment" do
    assert_difference('Answercomment.count', -1) do
      delete answercomment_url(@answercomment)
    end

    assert_redirected_to answercomments_url
  end
end
