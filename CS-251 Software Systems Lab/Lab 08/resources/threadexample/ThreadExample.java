package threadexample;

/**
 *
 * @author HP
 */

class CarelessWorker extends Thread {
    static Integer i=0;
    public void run()  {
	CarelessWorker.i++;
	try {
	    Thread.sleep(2);  // dilly dally for 2 ms
	}
	catch (InterruptedException e) {  // we are ignoring this
	}
	System.out.println("Careless Worker: " + CarelessWorker.i+ " is working");
    }
}


class CoordinatedWorker extends Thread{
    static Integer i=0;
    static Integer lock=0;
    public void run() {
	synchronized(CoordinatedWorker.lock){
            CoordinatedWorker.i++;
	    try {
		Thread.sleep(2); // dilly dally for 2 ms
	    }
	    catch (InterruptedException e) {
	    }
            System.out.println("Carefull Worker :" + CoordinatedWorker.i+ " is working");
	    /*
	      Synchronized(object){
	      ....
	      } 
	      Note:
	      Object variable should be different from the variable 
	      you are changing inside the block.
        
	      1. Synchronization block gives the lock to the thread 
	      in first come first serve fashion.
        
	      2. Only one thread among the threads, 
	      which shares the same memory of object variable,
	      can be inside block.
         
	    */

        }
    }
}

public class ThreadExample {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws InterruptedException {
        CarelessWorker[] threads2=new CarelessWorker[5];
        System.out.println("Without Synchronization");
        for(int i=0;i<5;i++){
            threads2[i]=new CarelessWorker();
            //Running thread one after another
            threads2[i].start();
        }

        Thread.sleep(2000); // just for demo purposes
        System.out.println("");
        CoordinatedWorker[] threads=new CoordinatedWorker[5];
        System.out.println("With Synchronization");
        for(int i=0;i<5;i++){
            threads[i]=new CoordinatedWorker();
            //Running thread one after another
            threads[i].start();
        }
    }
    
}
