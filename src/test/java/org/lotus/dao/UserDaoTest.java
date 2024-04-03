package org.lotus.dao;

import org.junit.jupiter.api.Test;
import org.lotus.pojo.User;
import org.lotus.utils.MD5Utils;


import static org.junit.jupiter.api.Assertions.*;

class UserDaoTest {
    UserDao userDao = new UserDao();

    @Test
    void testSearchWithExistUsername(){
        User user = new User("18d46aa2-67c3-11ed-aad7-a557c4d4d6b5","kouqinx_x" ,"33570da201879fc9d5f171fb38b5d36d","KOUQIN","XIONG");
        assertEquals(user, userDao.usernameExists("kouqinx_x"));
    }

    @Test
    void testSearchWithNonExistUsername(){
        assertNull(userDao.usernameExists("kouqin"));
    }

    @Test
    void testSearchWithNullUsername(){
        assertNull(userDao.usernameExists(null));
    }

    @Test
    void testInsertUserWithCompleteInfo(){
        User user = new User("yapjinghong" , MD5Utils.getMd5("1q2w3e4r?"),"Yap","Jing Hong");
        userDao.insertUser(user);
        User insertedUser = userDao.usernameExists("yapjinghong");
        assertNotNull(insertedUser);
    }

    @Test
    void testInsertUserWithUsernameMissing(){
        User user = new User();
        user.setFirstname("Tiew");
        user.setLastname("Qiao Wen");
        userDao.insertUser(user);
        assertDoesNotThrow(() -> {
            userDao.insertUser(user);
        });
        User insertedUser = userDao.usernameExists("null");
        assertNull(insertedUser);
    }

    @Test
    void testInsertUserWithPasswordMissing(){
        User user = new User();
        user.setUsername("jane.dyx");
        user.setFirstname("Ding");
        user.setLastname("Yuxin");
        userDao.insertUser(user);
        assertDoesNotThrow(() -> {
            userDao.insertUser(user);
        });
        User insertedUser = userDao.usernameExists("jane.dyx");
        assertNull(insertedUser);
    }

    @Test
    void testInsertUserWithFirstnameMissing(){
        User user = new User();
        user.setUsername("jane.dyx");
        user.setLastname("Yuxin");
        user.setPassword(MD5Utils.getMd5("1q2w3e4r?"));
        UserDao userDao = new UserDao();
        assertDoesNotThrow(() -> {
            userDao.insertUser(user);
        });
        User insertedUser = userDao.usernameExists("jane.dyx");
        assertNull(insertedUser);
    }

    @Test
    void testInsertUserWithLastnameMissing(){
        User user = new User();
        user.setUsername("jane.dyx");
        user.setFirstname("Ding");
        user.setPassword(MD5Utils.getMd5("1q2w3e4r?"));
        userDao.insertUser(user);
        assertDoesNotThrow(() -> {
            userDao.insertUser(user);
        });
        User insertedUser = userDao.usernameExists("jane.dyx");
        assertNull(insertedUser);
    }


}