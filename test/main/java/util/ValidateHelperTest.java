package util;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class ValidateHelperTest {

  public ValidateHelperTest() {
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
   * Test of isPhoneNumber method, of class ValidateHelper.
   */
  @Test
  public void isPhoneNumber() {
    //Data test number phone is valid
    String[] testPhoneNumber = new String[]{"0948307061", "0947849719", "0976724574"};
    //Data test number phone is invalid
    String[] testNotPhoneNumber = new String[]{"120948307061", "2947849719", "9012345678"};

    for (String s : testPhoneNumber
    ) {
      Assert.assertTrue("phone number is not correctly",ValidateHelper.isPhoneNumber(s));
    }

    for (String s : testNotPhoneNumber
    ) {
      Assert.assertFalse("phone number is correctly",ValidateHelper.isPhoneNumber(s));
    }
  }

  /**
   * Test of isEmail method, of class ValidateHelper.
   */
  @Test
  public void isEmail() {
    //Data test email is valid
    String[] testEmail = new String[]{"nghiatq@gmail.com", "hang123@fpt.edu.vn"};
    //Data test email is invalid
    String[] testNotEmail = new String[]{"@nghiatq@gmai", "hang123.fpt.edu.v"};

    for (String s : testEmail
    ) {
      Assert.assertTrue("email is not correctly",ValidateHelper.isEmail(s));
    }
    for (String s : testNotEmail
    ) {
      Assert.assertFalse("email is correctly",ValidateHelper.isEmail(s));
    }
  }

  /**
   * Test of isDate method, of class ValidateHelper.
   */
  @Test
  public void isDate() {
    //Data test date is valid
    String[] testDate = new String[]{"11-05-1999", "28-2-2019", "20-2-2019"};
    //Data test date is invalid
    String[] testNotDate = new String[]{"30-02-1999", "32-05-2019"};
    for (String s : testDate
    ) {
      Assert.assertTrue("date is not correctly",ValidateHelper.isDate(s));
    }
    for (String s : testNotDate
    ) {
      Assert.assertFalse("date is correctly",ValidateHelper.isDate(s));
    }
  }
}
