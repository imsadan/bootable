package csc.hfz.pojo;

public class Dayplans {
    private Long id;

    private String years;

    private String months;

    private String days;

    private Double intolnum;

    private Double sticksnum;

    private Double sticksweight;

    private Double beam;

    private Integer stauts;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Double getIntolnum() {
        return intolnum;
    }

    public void setIntolnum(Double intolnum) {
        this.intolnum = intolnum;
    }

    public Double getSticksnum() {
        return sticksnum;
    }

    public void setSticksnum(Double sticksnum) {
        this.sticksnum = sticksnum;
    }

    public Double getSticksweight() {
        return sticksweight;
    }

    public void setSticksweight(Double sticksweight) {
        this.sticksweight = sticksweight;
    }

    public Double getBeam() {
        return beam;
    }

    public void setBeam(Double beam) {
        this.beam = beam;
    }

    public Integer getStauts() {
        return stauts;
    }

    public void setStauts(Integer stauts) {
        this.stauts = stauts;
    }
}