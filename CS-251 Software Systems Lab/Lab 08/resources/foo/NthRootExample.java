/* put this file in the foo directory. go outside the foo directory
 * one level up, and run the program as java foo.NthRootExample */
package foo;

import java.math.BigInteger;

/**
 *
 * @author HP
 */
public class NthRootExample {

    /* simple non-optimized factorial */
    static BigInteger fact(BigInteger num){
        if(num.compareTo(BigInteger.ONE)==0)
            return BigInteger.ONE;
        return num.multiply(fact(num.subtract(BigInteger.ONE)));
    }

    public static void main(String[] args) {
        // TODO code application logic here
        
        BigInteger FIFTY=BigInteger.valueOf(50);
        System.out.println("Value of 50! is " + fact(FIFTY));
    }
}
