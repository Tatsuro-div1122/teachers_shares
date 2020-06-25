class Users::SearchController < ApplicationController
  before_action :authenticate_user!
  def search
    @model = params["search"]["model"]
    # 検索で選択したモデル
    keyword = params["search"]["keyword"].split(/[[:blank:]]+/).select(&:present?)
    # 検索で入力された文字 .splitメソッドで空白を見分ける　.selectで先頭に空白が存在しているかチェック
    # data = search_for(model, keyword)
    if @model == "User"
       @title = "先生の検索結果"
        users = []
        keyword.each do |keyword|
          next if keyword == ""
           users += User.where(['last_name LIKE ? OR first_name LIKE ? OR introduction LIKE ? OR school_name LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"]).or(User.where(subject: keyword)).or(User.where(school_type: keyword)).or(User.where(prefecture: keyword)).where.not(id: current_user).order("created_at DESC")
          #@users += User.where('last_name LIKE ?', "%#{keyword}%").or(User.where('first_name LIKE ?', "%#{keyword}%")).or(User.where('introduction LIKE ?', "%#{keyword}%")).or(User.where('school_name LIKE ?', "%#{keyword}%")).or(User.where(subject: keyword)).or(User.where(school_type: keyword)).or(User.where(prefecture: keyword)).where(deleted_at: nil).where.not(id: current_user)
        end
        users.uniq!
        @users = Kaminari.paginate_array(users).page(params[:page]).per(10)
        render 'users/users/index'
        return
    elsif @model == "Lesson"
        @title = "授業アイデアの検索結果"
        lessons = []
        keyword.each do |keyword|
          next if keyword == ""
           lessons += Lesson.where(['title LIkE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%"]).or(Lesson.where(subject: keyword)).or(Lesson.where(school_type: keyword)).or(Lesson.where(grade: keyword)).where.not(user_id: current_user).order("created_at DESC")
          #@lessons += Lesson.where('title LIKE ?', "%#{keyword}%").or(Lesson.where('description LIKE ?', "%#{keyword}%")).or(Lesson.where(subject: keyword)).or(Lesson.where(school_type: keyword)).or(Lesson.where(grade: keyword)).where.not(user_id: current_user).order("created_at DESC")
        end
        lessons.uniq!
        @lessons = Kaminari.paginate_array(lessons).page(params[:page]).per(10)
        render 'users/lessons/index'
        return
    elsif @model == "Counsel"
        @title = "悩み相談の検索結果"
        counsels = []
        keyword.each do |keyword|
          next if keyword == ""
          counsels += Counsel.where(['title LIkE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%"]).or(Counsel.where(category: keyword)).where.not(user_id: current_user).order("created_at DESC")
        end
        counsels.uniq!
        @counsels = Kaminari.paginate_array(counsels).page(params[:page]).per(10)
        render 'users/counsels/index'
        return
    end
  end

end
