package jdbc;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class MySqlConnectionTest {

  public MySqlConnectionTest() {
  }

  @BeforeClass
  public static void setUpClass() {
  }

  @AfterClass
  public static void tearDownClass() {
  }

  @Before
  public void setUp() {
  }

  @After
  public void tearDown() {
  }

  /**
   * Test of getConnection method, of class MySqlConnection.
   */
  @Test
  public void getConnection() {
    Assert.assertNotNull("Should be not null", MySqlConnection.getConnection());
  }
}
