class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]


  
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])  # ここで@prototypeを設定
    @comment = Comment.new
    @comments = @prototype.comments
  end  

  def edit
    @prototype = Prototype.find(params[:id])  # 必要に応じて@prototypeを取得
    unless @prototype.user == current_user
     redirect_to root_path, alert: 'あなたはこの投稿を編集する権限がありません。'
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to @prototype
    else
      render :edit
    end
  end

  def destroy
    prototype.destroy
    if @prototype
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end