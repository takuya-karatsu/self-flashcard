class FlashcardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flashcard, only: [:edit, :update, :show, :destroy, :toggle]

  #問題の一覧表示
  def index
    @q = Flashcard.ransack(params[:q])
    @flashcards = @q.result.includes(:user).order("created_at desc")
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

  def review
    @flashcards = Flashcard.order("RAND()").where(checkbox:true)
  end

  def toggle
    @flashcard.update(checkbox: !@flashcard.checkbox)
  
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          @flashcard,
          partial: "flashcard",
          locals: { flashcard: @flashcard }
        )
      end
    end
  end
  


  private
  def flashcard_params
    params.require(:flashcard).permit(:category, :question, :answer, :description).merge(user_id: current_user.id)
  end

  def set_flashcard
    @flashcard = Flashcard.find(params[:id])
  end
end