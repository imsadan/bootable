package csc.hfz.pojo;

public class Yeartotal {
    private Long id;

    private String years;

    private String months;

    private Double sumweight;

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

    public Double getSumweight() {
        return sumweight;
    }

    public void setSumweight(Double sumweight) {
        this.sumweight = sumweight;
    }
}