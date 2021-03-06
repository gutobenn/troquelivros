class BookInstancesController < ApplicationController
  before_action :set_book_instance, only: [:show, :edit, :update, :destroy]
  before_action :owner_only, only: [:edit, :destroy]

  # GET /book_instances
  # GET /book_instances.json
  def index
    params[:q].delete_if {|key, value| value == "0" } unless params[:q].nil?

    @q = BookInstance.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @book_instances = @q.result(distinct:true)

    respond_to do |format|
      format.html { @book_instances = @book_instances.paginate(page: params[:page], per_page: 20) }
    end
  end

  # GET /book_instances/1
  # GET /book_instances/1.json
  def show
  end

  # GET /book_instances/new
  def new
    @book_instance = BookInstance.new
  end

  # GET /book_instances/1/edit
  def edit
  end

  # POST /book_instances
  # POST /book_instances.json
  def create
    @book_instance = BookInstance.new(book_instance_params)
    @book_instance.user = current_user

    respond_to do |format|
      if @book_instance.save
        format.html { redirect_to @book_instance, notice: 'Book instance was successfully created.' }
        format.json { render :show, status: :created, location: @book_instance }
      else
        format.html { render :new }
        format.json { render json: @book_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_instances/1
  # PATCH/PUT /book_instances/1.json
  def update
    respond_to do |format|
      if @book_instance.update(book_instance_params)
        format.html { redirect_to @book_instance, notice: 'Book instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_instance }
      else
        format.html { render :edit }
        format.json { render json: @book_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_instances/1
  # DELETE /book_instances/1.json
  def destroy
    @book_instance.destroy
    respond_to do |format|
      format.html { redirect_to book_instances_url, notice: 'Book instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_instance
      @book_instance = BookInstance.find(params[:id])
    end

    def owner_only
      if @book_instance.user.id != current_user.id
        redirect_to root_path, :alert => "Acesso negado."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_instance_params
      params.require(:book_instance).permit(:book_id, :user_id, :description, :status, :troca, :emprestimo, :doacao)
    end
end
