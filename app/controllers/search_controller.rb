class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    # 検索で選択したモデル
    keyword = params["search"]["keyword"].split(/[[:blank:]]+/).select(&:present?)
    # 検索で入力された文字 .splitメソッドで空白を見分ける　.selectで先頭に空白が存在しているかチェック
    # data = search_for(model, keyword)
    if @model == "先生"
       @title = "検索結果（先生）"
        @users = []
        keyword.each do |keyword|
          next if keyword == ""
          @users += User.where(['family_name LIKE ?', "%#{keyword}%"])
                        .or(User.where(['last_name LIKE ?', "%#{keyword}%"]))
                        .or(User.where(['subject LIKE ?', "%#{keyword}%"]))
                        .or(User.where(['school_type LIKE ?', "%#{keyword}%"]))
                        .or(User.where(['school_name LIKE ?', "%#{keyword}%"]))
                        .or(User.where(['prefecture LIKE ?', "%#{keyword}%"]))
                        .or(User.where(['introduction LIKE ?', "%#{keyword}%"]))
        end
        @users.uniq!
    elsif @model == "授業アイデア"
        @title = "検索結果（授業アイデア）"
        @lessons = []
        keyword.each do |keyword|
          next if keyword == ""
          @lessons += Lesson.where("title LIkE ?", "%#{keyword}")
                            .or(Lesson.where(['description LIKE ?', "%#{keyword}%"]))
                            .or(Lesson.where(['subject LIKE ?', "%#{keyword}%"]))
                            .or(Lesson.where(['school_type LIKE ?', "%#{keyword}%"]))
                            .or(Lesson.where(['grade LIKE ?', "%#{keyword}%"]))
        end
          @lessons.uniq!
    end
  end

  private
  # def search_for(model, keyword)
  #   if model == '先生'
  #     User.where(['family_name LIKE ?', "%#{keyword}%"])
  #         .or(User.where(['last_name LIKE ?', "%#{keyword}%"]))
  #         .or(User.where(['subject LIKE ?', "%#{keyword}%"]))
  #         .or(User.where(['school_type LIKE ?', "%#{keyword}%"]))
  #         .or(User.where(['school_name LIKE ?', "%#{keyword}%"]))
  #         .or(User.where(['prefecture LIKE ?', "%#{keyword}%"]))
  #         .or(User.where(['introduction LIKE ?', "%#{keyword}%"]))
  #   elsif model == '授業アイデア'
  #     Lesson.where("title LIkE ?", "%#{keyword}")
  #         .or(Lesson.where(['description LIKE ?', "%#{keyword}%"]))
  #         .or(Lesson.where(['subject LIKE ?', "%#{keyword}%"]))
  #         .or(Lesson.where(['school_type LIKE ?', "%#{keyword}%"]))
  #         .or(Lesson.where(['grade LIKE ?', "%#{keyword}%"]))
  #         .or(Lesson.where([' LIKE ?', "%#{keyword}%"]))
  #   end
  # end

end
