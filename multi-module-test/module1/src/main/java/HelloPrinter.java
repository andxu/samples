import org.apache.commons.lang3.StringUtils;

public final class HelloPrinter {
    String printHello() {
        if (StringUtils.isBlank(" ")) {
            return "StringUtils.isBlank works!";
        }
        return "StringUtils.isBlank is malfunctioning";
    }
}
