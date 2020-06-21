class Users::HomeController < ApplicationController
  def top
    if user_signed_in?
      @lessons = Lesson.find(LessonLike.group(:lesson_id).order('count(lesson_id) desc').limit(6).pluck(:lesson_id))
      # ﾚｯｽﾝﾗﾝｷﾝｸﾞLessonLike.groupでlesson_idを持った「参考になった！」をまとめて、.orderでproduct_idを持つbookmarkを降順に並べる｡
      # .limit(6)で上から6つ取得、.pluckでlesson_idのみを数字で取り出すように指定。
      @users = User.where(deleted_at: nil, prefecture: current_user.prefecture).where.not(id: current_user.id).order("RANDOM()").limit(5)
      @counsels = Counsel.includes(:user).order("created_at DESC").limit(5)
      @lesson_subjects = ["国語", "社会", "算数/数学", "理科", "英語"]
      @counsel_categories = Counsel.all.group(:category).sample(5)
      @school_types = ["小学校", "中学校", "高等学校"]
      # 投稿された悩み相談のうち新しい５つのジャンルを取ってくる
      # counselのすべて、取り出し、categoryカラムで絞ってデータをまとめている（新しいもの順でまとまる）。
      # sampleメソッドはそのうちの新しい投稿を任意の数字分取り出している。
    end
  end

  def about
  end
end
