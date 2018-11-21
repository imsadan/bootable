package csc.hfz.pojo;

public class UserList {
    private Integer id;

    private String username;

    private String password;

    private String creaded;

    private String logined;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getCreaded() {
        return creaded;
    }

    public void setCreaded(String creaded) {
        this.creaded = creaded == null ? null : creaded.trim();
    }

    public String getLogined() {
        return logined;
    }

    public void setLogined(String logined) {
        this.logined = logined == null ? null : logined.trim();
    }
}