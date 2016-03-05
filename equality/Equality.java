class Equality {

public static void main (String[] args) {
  MyInteger a = new MyInteger(42);
  MyInteger b = new MyInteger(42);
  MyInteger c = new MyInteger(43);
  MyInteger d = c;
  String s1 = "Chris";
  String s2 = "Chris";
  System.out.println("\n a = " + a + ",b = " + b + "\n");
  System.out.println("\n a == b is " + (a == b) + "\n");
  System.out.println("\n s1 == s2 is " + (s1 == s2) + "\n");
  System.out.println("\nd = " + d + "\n");
  System.out.println("\n c == d is " + (c == d) + "\n");
  c.setV(44);
  System.out.println("\n c = " + c +  "\n");
}


}
