class FlashcardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flashcard, only: [:edit, :update, :show, :destroy]

  #問題の一覧表示
  def index
    @q = Flashcard.ransack(params[:q])
    @flashcards = @q.result.includes(:user).order("flashcards.created_at asc")
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
    #indexへリダイレクト
      redirect_to controller: 'flashcards', action: 'index'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  #問題の編集
  def edit
  end

  #問題の更新
  def update
    @flashcards = Flashcard.all
    if @flashcard.update(flashcard_params)
      redirect_to controller: 'flashcards', action: 'index'
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def show
  end

  #問題の削除
  def destroy
    @flashcard.destroy
    redirect_to controller: 'flashcards', action: 'index', status: :see_other
  end

  #flashcardでの学習
  def learning
    # quiz = rand(Flashcard.first.id..Flashcard.last.id)
    # @flashcards = Flashcard.where('id >=?', quiz).all
    @flashcards = Flashcard.order("RAND()").all
  end

  private
  def flashcard_params
    params.require(:flashcard).permit(:category, :question, :answer, :description).merge(user_id: current_user.id)
  end

  def set_flashcard
    @flashcard = Flashcard.find(params[:id])
  end
end