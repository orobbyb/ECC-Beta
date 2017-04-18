class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:show, :browse]
  rescue_from Elasticsearch::Persistence::Repository::DocumentNotFound do
    render file: "public/404.html", status: 404, layout: false
  end
  
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end
  
  def browse
    all_docs=Document.all
    @documents =  Kaminari.paginate_array(all_docs).page(params[:page]).per(5)
    
  end

  # GET /documents/1/edit
  def edit
    populate_dropdowns
    get_default_copywrite
  end

  def new
    @document =Document.new
   populate_dropdowns
    get_default_copywrite
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)
    populate_dropdowns
    get_default_copywrite
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:title, :year, :institution, :contributor, :code_versions, :date_publish, :ecc_date, :author_site, :orig_url, :description, :notes, :doi, :copyright, :topics, :fields, :backup_url)
    end
    def get_default_copywrite
      @default_copywrite="filler for now"
    end
    def populate_dropdowns
       @topics = ["test1","test2","test3","test4"]
       @fields = ["test1","test2","test3","test4"]
       @institution = ["test1","test2","test3","test4"]
    end
end
