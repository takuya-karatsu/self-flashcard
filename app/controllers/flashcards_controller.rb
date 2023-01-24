class FlashcardsController < ApplicationController
  #問題の一覧表示
  def index
    @flashcards = Flashcard.all

  end

  #問題解答ページ表示
  def show
    @flashcard =Flashcard.find(params[:id])
  end

  #問題の作成
  def new
    @flashcard = Flashcard.new
  end

  #問題の登録
  def create
    #Flashcardモデルを初期化
    @flashcard = Flashcard.new(flashcard_params)
    #FlashcardモデルをDBへ保存
    if @flashcard.save
    #showへリダイレクト
      redirect_to @flashcard
    else
      render 'new', status: :unprocessable_entity
    end
  end

  #問題の編集
  def edit

  end

  #問題の更新
  def update

  end

  #問題の削除
  def destroy

  end

  private
  def flashcard_params
    params.require(:flashcard).permit(:category, :question, :answer, :description)
  end
end
