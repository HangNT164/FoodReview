package util;

public class ValidateHelper {

    /**
     * Check format phone number with Vietnam region.
     */
    private static final String REGEX_PHONE = "0[9|8|3|7|5][0-9]{8}";

    /**
     * Check format Email.
     */
    private static final String REGEX_EMAIL = "^[\\w-\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";

    /**
     * Check format Password.
     */
    private static final String REGEX_PASSWORD = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";


    /**
     * Check phone number is valid or not.
     *
     * @param phone need to check
     * @return true if phone number is valid
     * false if phone number is invalid
     */
    public static boolean isPhoneNumber(String phone) {
        return phone.matches(REGEX_PHONE);
    }

    /**
     * Check email is valid or not.
     *
     * @param email need to check
     * @return true if email is valid
     * false if email is invalid
     */
    public static boolean isEmail(String email) {
        return email.matches(REGEX_EMAIL);
    }

    /**
     * Check date is valid or not.
     *
     * @param password need to check
     * @return true if date is valid
     * false if date is invalid
     */
    public static boolean isPassword(String password) {
        return password.matches(REGEX_PASSWORD);
    }

    public static int getValidateID(String strID) {
        int number = -1;
        try {
            number = Integer.parseInt(strID.trim());
        } catch (NumberFormatException e) {
            e.printStackTrace(System.out);
        }
        return number;
    }

    public static String convertFormatDate(String date) {
        String convert = "";
        String[] dates = date.split("-");
        if (dates.length > 0) {
            convert = dates[2] + "/" + dates[1] + "/" + dates[0];
        }
        return convert;
    }

    public static void main(String[] args) {
        System.out.println(isPhoneNumber("09425786857"));
    }
}
