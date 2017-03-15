require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document = documents(:one)
  end

  test "should get index" do
    get documents_url
    assert_response :success
  end

  test "should get new" do
    get new_document_url
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post documents_url, params: { document: { author_site: @document.author_site, backup_url: @document.backup_url, code_versions: @document.code_versions, contributor: @document.contributor, copyright: @document.copyright, date_publish: @document.date_publish, description: @document.description, doi: @document.doi, ecc_date: @document.ecc_date, fields: @document.fields, institution: @document.institution, notes: @document.notes, orig_url: @document.orig_url, title: @document.title, topics: @document.topics, year: @document.year } }
    end

    assert_redirected_to document_url(Document.last)
  end

  test "should show document" do
    get document_url(@document)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_url(@document)
    assert_response :success
  end

  test "should update document" do
    patch document_url(@document), params: { document: { author_site: @document.author_site, backup_url: @document.backup_url, code_versions: @document.code_versions, contributor: @document.contributor, copyright: @document.copyright, date_publish: @document.date_publish, description: @document.description, doi: @document.doi, ecc_date: @document.ecc_date, fields: @document.fields, institution: @document.institution, notes: @document.notes, orig_url: @document.orig_url, title: @document.title, topics: @document.topics, year: @document.year } }
    assert_redirected_to document_url(@document)
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete document_url(@document)
    end

    assert_redirected_to documents_url
  end
end
