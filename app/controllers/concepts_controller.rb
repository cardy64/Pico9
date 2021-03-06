class ConceptsController < ApplicationController

  http_basic_authenticate_with name: "gapplechief", password: "gapplechief", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @concept = @article.concepts.create(concept_params)
#     redirect_to article_path(@article)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @concept = @article.concepts.find(params[:id])
    @concept.destroy
#     redirect_to article_path(@article), status: 303
    redirect_back(fallback_location: root_path)
  end

  private
    def concept_params
      params.require(:concept).permit(:concept_id, :stars, :url, :why)
    end
end
