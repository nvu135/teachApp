package model;

public class Lesson {
    private String lessonId;
    private String name;
    private String description;
    private String rate;

    public Lesson(String lessonId, String name, String description, String rate) {
        this.lessonId = lessonId;
        this.name = name;
        this.description = description;
        this.rate = rate;
    }

    public String getLessonId() {
        return lessonId;
    }

    public void setLessonId(String lessonId) {
        this.lessonId = lessonId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }
}
