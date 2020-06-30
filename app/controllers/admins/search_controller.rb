class Admins::SearchController < ApplicationController
  before_action :authenticate_admin!
  def search
    @title = "検索結果"
    @model = params["search"]["model"]
    # 検索で選択したモデル
    keyword = params["search"]["keyword"].split(/[[:blank:]]+/).select(&:present?)
    # 検索で入力された文字 .splitメソッドで空白を見分ける　.selectで先頭に空白が存在しているかチェック
    # data = search_for(model, keyword)
    if @model == "User"
 
        users = []
        keyword.each do |keyword|
          next if keyword == ""
           users += 
           User.where(
              ['last_name LIKE ? OR first_name LIKE ? OR introduction LIKE ? OR school_name LIKE ?',
              "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"]
             ).order("created_at DESC")
        end
        users.uniq!
        @users = Kaminari.paginate_array(users).page(params[:page]).per(10)
        render 'admins/users/index'
        return
    elsif @model == "Lesson"
        lessons = []
        keyword.each do |keyword|
          next if keyword == ""
           lessons += 
             Lesson.where(
               ['title LIkE ? OR description LIKE ?',
               "%#{keyword}%", "%#{keyword}%"]
              ).order("created_at DESC")
        end
        lessons.uniq!
        @lessons = Kaminari.paginate_array(lessons).page(params[:page]).per(10)
        render 'admins/lessons/index'
        return
    elsif @model == "Counsel"
        counsels = []
        keyword.each do |keyword|
          next if keyword == ""
          counsels += 
            Counsel.where(
              ['title LIkE ? OR description LIKE ?',
               "%#{keyword}%", "%#{keyword}%"]
              ).order("created_at DESC")
        end
        counsels.uniq!
        @counsels = Kaminari.paginate_array(counsels).page(params[:page]).per(10)
        render 'admins/counsels/index'
        return
    end
  end
end
