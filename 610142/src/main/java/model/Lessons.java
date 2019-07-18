package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Lessons {
    private HashMap<String, LessonItem> lessons = new HashMap<String, LessonItem>();

    public List<LessonItem> getLessons() {
        return new ArrayList<LessonItem>(lessons.values());
    }

    public void setLessons(HashMap<String, LessonItem> lessons) {
        this.lessons = lessons;
    }

    public void addLessonItem(LessonItem lessonItem) {
        lessons.put(lessonItem.getLessonItemId(), lessonItem);
    }

    public LessonItem getLessonItem(String lessonItemId) {
        return lessons.get(lessonItemId);
    }

    public void deleteLessonItem(LessonItem lessonItem) {
        lessons.remove(lessonItem);
    }

}
