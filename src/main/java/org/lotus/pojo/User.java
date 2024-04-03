package org.lotus.pojo;

import java.util.Objects;

/**
 * Pojo class: User
 * to store the attributes of a user
 * which should match the User Table in mysql
 */
public class User {
    private String uid;
    private String username;
    private String password;
    private String firstname;
    private String lastname;

    public User() {
    }

    public User(String uid, String username, String password, String firstname, String lastname) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
    }

    public User(String username, String password, String firstname, String lastname) {
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return uid.equals(user.uid) && username.equals(user.username) && password.equals(user.password) && firstname.equals(user.firstname) && lastname.equals(user.lastname);
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, username, password, firstname, lastname);
    }
}
