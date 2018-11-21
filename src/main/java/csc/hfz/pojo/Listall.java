package csc.hfz.pojo;

public class Listall {
    private Long id;

    private String name;

    private String address;

    private String mintext;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getMintext() {
        return mintext;
    }

    public void setMintext(String mintext) {
        this.mintext = mintext == null ? null : mintext.trim();
    }
}