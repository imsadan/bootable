package csc.hfz.pojo;

public class Daycloths {
    private Long id;

    private String wei;

    private String jin;

    private Integer numbers;

    private String years;

    private String months;

    private String days;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getWei() {
        return wei;
    }

    public void setWei(String wei) {
        this.wei = wei == null ? null : wei.trim();
    }

    public String getJin() {
        return jin;
    }

    public void setJin(String jin) {
        this.jin = jin == null ? null : jin.trim();
    }

    public Integer getNumbers() {
        return numbers;
    }

    public void setNumbers(Integer numbers) {
        this.numbers = numbers;
    }

    public String getYears() {
        return years;
    }

    public void setYears(String years) {
        this.years = years == null ? null : years.trim();
    }

    public String getMonths() {
        return months;
    }

    public void setMonths(String months) {
        this.months = months == null ? null : months.trim();
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days == null ? null : days.trim();
    }
}