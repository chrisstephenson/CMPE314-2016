public class Test {
	public static void main(String[] args) {
		// creating a box object with the int value of 2
		Box<Integer> b1 = new Box<Integer>(2);
		// changing its value to 3
		b1.setValue(3);
		
		// printing the value of b1
		System.out.println(b1.getValue());
		
		// ---------------------------------
		
		// creating a box object with the Integer value of 2
		Box<Integer> b2 = new Box<Integer>(new Integer(2));
		// changing its value to 3
		b2.setValue(new Integer(3));
		
		// printing the value of b2
		System.out.println(b2.getValue());
	}
}