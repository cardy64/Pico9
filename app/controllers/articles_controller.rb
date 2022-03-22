class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "gapplechief", password: "gapplechief", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    uploaded_file_html = article_params[:pico_file_html]
    uploaded_file_js = article_params[:pico_file_js]

    @article = Article.new(title: article_params[:title],body: article_params[:body],status: article_params[:status])

    fileName = uploaded_file_js.original_filename

    if fileName.include?(".js")
        fileName = fileName[0..-4]
    end

    Dir.mkdir("public/pico8_games/" + fileName)

    File.open(Rails.root.join('public', 'pico8_games',fileName,'index.html'), 'wb') do |file|
      file.write(uploaded_file_html.read)
    end
    File.open(Rails.root.join('public', 'pico8_games',fileName,uploaded_file_js.original_filename), 'wb') do |file|
      file.write(uploaded_file_js.read)
    end
    @article.pico_path = fileName

    if @article.save!
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :pico_file_html, :pico_file_js)
    end
end
