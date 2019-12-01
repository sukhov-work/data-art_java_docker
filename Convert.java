//Standalone utility to fix aotconfig method name for jaotc compiler config

/*
*  Possible usage example:
*
*  javac Convert.java
*
*  see dart-d5-clean-touched-methods alias in commands.sh  for details
*
* */

public class Convert {
    public static void main(String args[]) throws Throwable {
        int i;
        boolean inParams = false;
        while ((i = System.in.read()) >= 0) {
            switch (i) {
                case ':':
                    continue; // skip
                case '/':
                    if (!inParams) {
                        i = '.';
                    }
                    break;
                case '(':
                    inParams = true;
                    break;
                case '\n':
                case '\r':
                    inParams = false;
                    break;
            }
            System.out.write(i);
        }
    }
}
