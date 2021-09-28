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
     * Check format date.
     */
    private static final String REGEX_DATE =
            "^(?:(?:31(\\/|-|\\.)(?:0?[13578]|1[02]))\\1|"
                    + "(?:(?:29|30)(\\/|-|\\.)"
                    + "(?:0?[1,3-9]|1[0-2])\\2))"
                    + "(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$"
                    + "|^(?:29(\\/|-|\\.)0?2\\3(?:(?:(?:1[6-9]|[2-9]\\d)?(?:0[48]|[2468][048]|[13579][26])|"
                    + "(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]"
                    + "|1\\d|2[0-8])(\\/|-|\\.)(?:(?:0?[1-9])"
                    + "|(?:1[0-2]))\\4(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$";


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
     * @param date need to check
     * @return true if date is valid
     * false if date is invalid
     */
    public static boolean isDate(String date) {
        return date.matches(REGEX_DATE);
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
}
