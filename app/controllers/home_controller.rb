class HomeController < ApplicationController
  def top
    @lessons = Lesson.find(LessonLike.group(:lesson_id).order('count(lesson_id) desc').limit(6).pluck(:lesson_id))
    # ﾚｯｽﾝﾗﾝｷﾝｸﾞLessonLike.groupでlesson_idを持った「参考になった！」をまとめて、.orderでproduct_idを持つbookmarkを降順に並べる｡
    # .limit(6)で上から6つ取得、.pluckでlesson_idのみを数字で取り出すように指定。
    @users = User.where(deleted_at: nil, prefecture: current_user.prefecture).where.not(id: current_user.id).order("RANDOM()").limit(5)
  end

  def about
  end
end
