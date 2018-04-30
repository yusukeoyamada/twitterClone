class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  def show
  end

  def index
    @tweets = Tweet.all
  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"ブログを削除しました！"
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:content)
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
