package examples.students;

import com.intuit.karate.junit5.Karate;

public class StudentsRunner {
    
    /**
     * Executes Karate tests for students.
     * 
     * This test method runs all feature files located in the "students" directory
     * relative to the current test class location. The tests are executed using the
     * Karate testing framework.
     * 
     * @return Karate object containing the test execution configuration and results
     */
     @Karate.Test
    Karate testUsers() {
        return Karate.run("students").relativeTo(getClass());
    }  
}
