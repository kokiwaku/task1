class MypagesController < ApplicationController
  before_action :set_mypage, only: [:edit, :update, :destroy]
    
  def index
    @mypages = Mypage.all
  end

  def new
    if params[:back]
      @mypage = Mypage.new(mypages_params)
    else
      @mypage = Mypage.new
    end
  end

  def create
    @mypage = Mypage.new(mypages_params)
    if @mypage.save
      redirect_to mypages_path, notice: "tweetを投稿しました！"
    else 
      render 'new'
    end
  end
  
  def edit
  end
    
  def update
    if @mypage.update(mypages_params)
      redirect_to mypages_path, notice: "tweetを編集しました！"  
    else
      render 'edit'
    end
  end 
  
  def destroy
    @mypage.destroy
    redirect_to mypages_path, notice: "tweetを削除しました。"
  end  
  
  def confirm
    @mypage = Mypage.new(mypages_params)
    render :new if @mypage.invalid?
  end
  
  private
    def mypages_params
      params.require(:mypage).permit(:content)
    end
    
    def set_mypage
      @mypage = Mypage.find(params[:id])
    end

end
