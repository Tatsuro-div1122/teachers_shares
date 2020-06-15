class Users::SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    # 検索で選択したモデル
    keyword = params["search"]["keyword"].split(/[[:blank:]]+/).select(&:present?)
    # 検索で入力された文字 .splitメソッドで空白を見分ける　.selectで先頭に空白が存在しているかチェック
    # data = search_for(model, keyword)
    if @model == "User"
       @title = "検索結果（先生）"
        @users = []
        keyword.each do |keyword|
          next if keyword == ""
          #@users += User.where(['family_name LIKE ? OR last_name LIKE ? OR introduction LIKE ? OR subject LIKE ? OR school_type LIKE ? OR school_name LIKE ? OR prefecture LIKE ?',
                  #{}"%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"]).where(deleted_at: nil)
                  @users += User.where(['family_name LIKE ? OR last_name LIKE ? OR introduction LIKE ? OR school_name LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%" , "%#{keyword}%"])
                                .or(User.where(subject: keyword)).or(User.where(school_type: keyword)).or(User.where(prefecture: keyword)).where(deleted_at: nil).where.not(id: current_user)
        end
        @users.uniq!
        render 'users/users/index'
        return
    elsif @model == "Lesson"
        @title = "検索結果（授業アイデア）"
        @lessons = []
        keyword.each do |keyword|
          next if keyword == ""
          @lessons += Lesson.where('title LIkE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%")
                            .or(Lesson.where(subject: keyword)).or(Lesson.where(school_type: keyword)).or(Lesson.where(grade: keyword)).where.not(user_id: current_user.id)
        end
        @lessons.uniq!
        render 'users/lessons/index'
        return
    end
  end

end
