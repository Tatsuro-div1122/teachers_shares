class Admins::SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    # 検索で選択したモデル
    keyword = params["search"]["keyword"].split(/[[:blank:]]+/).select(&:present?)
    # 検索で入力された文字 .splitメソッドで空白を見分ける　.selectで先頭に空白が存在しているかチェック
    # data = search_for(model, keyword)
    if @model == "User"
       @title = "先生の検索結果"
        @users = []
        keyword.each do |keyword|
          next if keyword == ""
          @users += User.where(['last_name LIKE ? OR first_name LIKE ? OR introduction LIKE ? OR subject LIKE ? OR school_type LIKE ? OR school_name LIKE ? OR prefecture LIKE ?',
                      "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"]).where(deleted_at: nil)
                      .order("created_at DESC")
        end
        @users.uniq!
        render 'admins/users/index'
        return
    elsif @model == "Lesson"
        @title = "授業アイデアの検索結果"
        @lessons = []
        keyword.each do |keyword|
          next if keyword == ""
          @lessons += Lesson.where(['title LIkE ? OR description LIKE ? OR subject LIKE ? OR school_type LIKE ? OR grade LIKE ?',
                        "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
                        .order("created_at DESC")
        end
        @lessons.uniq!
        render 'admins/lessons/index'
        return
    end
  end
end
