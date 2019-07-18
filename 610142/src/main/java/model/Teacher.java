package model;

import java.util.List;

public class Teacher {
    private String teacherId;
    private String firstName;
    private String lastName;
    private Number lessonTotalNum;
    private String[] teachLanguages;
    private String country;
    private Number star;
    private String aboutDescription;
    private String[] teachingMaterial;
    private List<Lesson> lessons;
    private List<Period> availableTime;

    public Teacher(String teacherId, String firstName, String lastName, Number lessonTotalNum, String aboutDescription, String[] teachLanguages, String[] teachingMaterial) {
        this.teacherId = teacherId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.lessonTotalNum = lessonTotalNum;
        this.aboutDescription = aboutDescription;
        this.teachLanguages = teachLanguages;
        this.teachingMaterial = teachingMaterial;

    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Number getLessonTotalNum() {
        return lessonTotalNum;
    }

    public void setLessonTotalNum(Number lessonTotalNum) {
        this.lessonTotalNum = lessonTotalNum;
    }

    public String[] getTeachLanguages() {
        return teachLanguages;
    }

    public void setTeachLanguages(String[] teachLanguages) {
        this.teachLanguages = teachLanguages;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Number getStar() {
        return star;
    }

    public void setStar(Number star) {
        this.star = star;
    }

    public String getAboutDescription() {
        return aboutDescription;
    }

    public void setAboutDescription(String aboutDescription) {
        this.aboutDescription = aboutDescription;
    }

    public String[] getTeachingMaterial() {
        return teachingMaterial;
    }

    public void setTeachingMaterial(String[] teachingMaterial) {
        this.teachingMaterial = teachingMaterial;
    }

    public List<Lesson> getLessons() {
        return lessons;
    }

    public void setLessons(List<Lesson> lessons) {
        this.lessons = lessons;
    }

    public List<Period> getAvailableTime() {
        return availableTime;
    }

    public void setAvailableTime(List<Period> availableTime) {
        this.availableTime = availableTime;
    }
}
