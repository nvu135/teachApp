package model;

public class LessonItem {
    private String lessonItemId;
    private Lesson lesson;
    private Period period;
    private String teacherId;

    public LessonItem(String lessonItemId, Lesson lesson, Period period, String teacherId) {
        this.lessonItemId = lessonItemId;
        this.lesson = lesson;
        this.period = period;
        this.teacherId = teacherId;
    }

    public String getLessonItemId() {
        return lessonItemId;
    }

    public void setLessonItemId(String lessonItemId) {
        this.lessonItemId = lessonItemId;
    }

    public Lesson getLesson() {
        return lesson;
    }

    public void setLesson(Lesson lesson) {
        this.lesson = lesson;
    }

    public Period getPeriod() {
        return period;
    }

    public void setPeriod(Period period) {
        this.period = period;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }
}
