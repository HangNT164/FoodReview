package service;

import bean.Account;
import dao.AccountDao;

public class AccountService {

    private AccountDao accountDao = new AccountDao();

    public Account login(String email, String password) {
        return accountDao.login(email, password);
    }
}
