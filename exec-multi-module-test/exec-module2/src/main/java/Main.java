public final class Main {
    public static void main(String[] args) {
        if (args.length > 0) {
            System.out.println("args[0] is " + args[0]);
        }
        
        new MyPrinter().printHello();
    }
}
