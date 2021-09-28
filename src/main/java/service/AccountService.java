package service;

import bean.Account;
import dao.AccountDao;

import java.util.List;

public class AccountService {

    private AccountDao accountDao = new AccountDao();

    public Account login(String email, String password) {
        return accountDao.login(email, password);
    }

    public List<Account> searchAccountByName(String name) {
        return accountDao.searchAccountByName(name);
    }
}
