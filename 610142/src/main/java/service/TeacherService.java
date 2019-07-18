package service;

import model.Period;
import model.Teacher;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TeacherService {

    private static HashMap<String, Teacher> teachers = new HashMap<String, Teacher>();

    static {
        String aboutDescription = "Hello everyone! I'm 27 years old and I'm from Vietnam! I was born in Phu Quoc island, whose beauty should be compared with a paradise I believe, I'm proud to get to say that it is my original hometown, I have been living in Ho Chi Minh city (Saigon city) for almost 9 years now, and with no doubt, I love this city like my second home, it never stops making me feel amazed! I once decided to spend a month to travel around Vietnam when I was 22 since I love traveling! Beside it, I also love making new friends, because when we get to meet and talk to people, the world is naturally brought to us then, through other stories and experiences, I do believe so!\n";
        String[] teachLanguages = new String[] {"English, Spanish"};
        String[] teachingMaterial = new String[] {
               "Text Documents",
               "Presentation slides/PPT",
               "Homework assignments",
               "Video files",
               "Flashcards",
               "Articles and news" };
        Teacher teacher1 = new Teacher("1", "John", "Lewis", 1000, aboutDescription, teachLanguages, teachingMaterial );
        Teacher teacher2 = new Teacher("2", "David", "Harbour", 1000, aboutDescription, teachLanguages, teachingMaterial );
        Teacher teacher3 = new Teacher("3", "Lily", "Lily", 1000, aboutDescription, teachLanguages, teachingMaterial );
        List<Period> availableTime1 = new ArrayList<Period>();
        Period period1 = new Period("2019-07-17T10:00:00", "2019-07-17T10:30:00");
        Period period2 = new Period("2019-07-17T13:00:00", "2019-07-17T13:30:00");
        Period period3 = new Period("2019-07-16T11:00:00", "2019-07-16T11:30:00");
        Period period4 = new Period("2019-07-15T08:00:00", "2019-07-15T10:30:00");
        Period period5 = new Period("2019-07-14T12:00:00", "2019-07-14T14:30:00");
        Period period6 = new Period("2019-07-18T12:00:00", "2019-07-18T14:30:00");

        availableTime1.add(period1);
        availableTime1.add(period2);
        availableTime1.add(period3);
        availableTime1.add(period4);
        availableTime1.add(period5);
        availableTime1.add(period6);

        teacher1.setAvailableTime(availableTime1);
        teacher2.setAvailableTime(availableTime1);
        teacher3.setAvailableTime(availableTime1);

        teachers.put("1", teacher1);
        teachers.put("2", teacher2);
        teachers.put("3", teacher3);


    }

    public List<Teacher> retrieveTeachers() {
        return new ArrayList<Teacher>(teachers.values());
    }

    public void addTeacher(Teacher teacher) {
        teachers.put(teacher.getTeacherId(), teacher);
    }

    public Teacher getTeacher(String teacherId) {
        return teachers.get(teacherId);
    }

    public void deleteTeacher(Teacher teacher) {
        teachers.remove(teacher);
    }

}


