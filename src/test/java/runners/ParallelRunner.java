package runners;

import org.junit.jupiter.api.Test;
import runners.General.GeneralRunner;

public class ParallelRunner {

    private final static String PATH = "/src/test/resources/";

    private final static Integer THREADS = 1;

    private final static String FLOWS = "Reto Tecnico Booking";

    private final static String TAGS = "~@ignore";

    @Test
    void testParallel() {
        GeneralRunner.testParallel(PATH, THREADS, FLOWS, TAGS );
    }

}
