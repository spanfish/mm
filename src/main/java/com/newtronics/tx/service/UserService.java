package com.newtronics.tx.service;

import java.util.List;

import com.newtronics.tx.model.User;
import org.springframework.transaction.annotation.Transactional;

public interface UserService {

    void insertUser(User user);

    User getUser(String username);

    List<User> getUsers();
}
