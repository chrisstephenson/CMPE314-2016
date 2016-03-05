package binomialcoefficient;

import static org.junit.Assert.*;

import org.junit.Test;

public class BinomialProgramTest extends BinomialProgram
{

   @Test
   public void test()
   {
      assertEquals(2,combinations(2,1));
      assertEquals(12,combinations(12,1));
      assertEquals(15,combinations(15,1));
      assertEquals(105,combinations(15,2));
      assertEquals(1175,combinations(50,2));
   }

}
