class Users::HomeController < ApplicationController
  before_action :authenticate_user!
  def top
    if user_signed_in?
      @lessons = Lesson.find(LessonLike.group(:lesson_id).order('count(lesson_id) desc').limit(6).pluck(:lesson_id))
      # ﾚｯｽﾝﾗﾝｷﾝｸﾞLessonLike.groupでlesson_idを持った「参考になった！」をまとめて、.orderでproduct_idを持つbookmarkを降順に並べる｡
      # .limit(6)で上から6つ取得、.pluckでlesson_idのみを数字で取り出すように指定。
      @users = User.where(deleted_at: nil, prefecture: current_user.prefecture).where.not(id: current_user.id).order("RANDOM()").limit(5)
      @counsels = Counsel.includes(:user).order("created_at DESC").limit(5)
      @lesson_subjects = ["国語", "社会", "算数/数学", "理科", "英語"]
      @counsel_categories = ["授業", "学級経営", "生徒指導", "部活動", "校務分掌", "職員関係"]
      # 投稿された悩み相談のうち新しい５つのジャンルを取ってくる
      # counselのすべて、取り出し、categoryカラムで絞ってデータをまとめている（新しいもの順でまとまる）。
      # sampleメソッドはそのうちの新しい投稿を任意の数字分取り出している。
      @school_types = ["小学校", "中学校", "高等学校"]
      @total_likes = 0
      user_lessons = current_user.lessons
      user_lessons.each do |user_lesson|
         @total_likes += LessonLike.where(lesson_id: user_lesson.id).count
      end
      user_lesson_comments = current_user.lesson_comments
      user_lesson_comments.each do |user_lesson_comment|
         @total_likes += LessonCommentLike.where(lesson_comment_id: user_lesson_comment.id).count
      end
      user_counsel_comments = current_user.counsel_comments
      user_counsel_comments.each do |user_counsel_comment|
         @total_likes += CounselCommentLike.where(counsel_comment_id: user_counsel_comment.id).count
      end
    end
  end

end
