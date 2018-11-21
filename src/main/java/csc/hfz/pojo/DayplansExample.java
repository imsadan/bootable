package csc.hfz.pojo;

import java.util.ArrayList;
import java.util.List;

public class DayplansExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DayplansExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andYearsIsNull() {
            addCriterion("years is null");
            return (Criteria) this;
        }

        public Criteria andYearsIsNotNull() {
            addCriterion("years is not null");
            return (Criteria) this;
        }

        public Criteria andYearsEqualTo(String value) {
            addCriterion("years =", value, "years");
            return (Criteria) this;
        }

        public Criteria andYearsNotEqualTo(String value) {
            addCriterion("years <>", value, "years");
            return (Criteria) this;
        }

        public Criteria andYearsGreaterThan(String value) {
            addCriterion("years >", value, "years");
            return (Criteria) this;
        }

        public Criteria andYearsGreaterThanOrEqualTo(String value) {
            addCriterion("years >=", value, "years");
            return (Criteria) this;
        }

        public Criteria andYearsLessThan(String value) {
            addCriterion("years <", value, "years");
            return (Criteria) this;
        }

        public Criteria andYearsLessThanOrEqualTo(String value) {
            addCriterion("years <=", value, "years");
            return (Criteria) this;
        }

        public Criteria andYearsLike(String value) {
            addCriterion("years like", value, "years");
            return (Criteria) this;
        }

        public Criteria andYearsNotLike(String value) {
            addCriterion("years not like", value, "years");
            return (Criteria) this;
        }

        public Criteria andYearsIn(List<String> values) {
            addCriterion("years in", values, "years");
            return (Criteria) this;
        }

        public Criteria andYearsNotIn(List<String> values) {
            addCriterion("years not in", values, "years");
            return (Criteria) this;
        }

        public Criteria andYearsBetween(String value1, String value2) {
            addCriterion("years between", value1, value2, "years");
            return (Criteria) this;
        }

        public Criteria andYearsNotBetween(String value1, String value2) {
            addCriterion("years not between", value1, value2, "years");
            return (Criteria) this;
        }

        public Criteria andMonthsIsNull() {
            addCriterion("months is null");
            return (Criteria) this;
        }

        public Criteria andMonthsIsNotNull() {
            addCriterion("months is not null");
            return (Criteria) this;
        }

        public Criteria andMonthsEqualTo(String value) {
            addCriterion("months =", value, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsNotEqualTo(String value) {
            addCriterion("months <>", value, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsGreaterThan(String value) {
            addCriterion("months >", value, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsGreaterThanOrEqualTo(String value) {
            addCriterion("months >=", value, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsLessThan(String value) {
            addCriterion("months <", value, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsLessThanOrEqualTo(String value) {
            addCriterion("months <=", value, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsLike(String value) {
            addCriterion("months like", value, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsNotLike(String value) {
            addCriterion("months not like", value, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsIn(List<String> values) {
            addCriterion("months in", values, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsNotIn(List<String> values) {
            addCriterion("months not in", values, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsBetween(String value1, String value2) {
            addCriterion("months between", value1, value2, "months");
            return (Criteria) this;
        }

        public Criteria andMonthsNotBetween(String value1, String value2) {
            addCriterion("months not between", value1, value2, "months");
            return (Criteria) this;
        }

        public Criteria andDaysIsNull() {
            addCriterion("days is null");
            return (Criteria) this;
        }

        public Criteria andDaysIsNotNull() {
            addCriterion("days is not null");
            return (Criteria) this;
        }

        public Criteria andDaysEqualTo(String value) {
            addCriterion("days =", value, "days");
            return (Criteria) this;
        }

        public Criteria andDaysNotEqualTo(String value) {
            addCriterion("days <>", value, "days");
            return (Criteria) this;
        }

        public Criteria andDaysGreaterThan(String value) {
            addCriterion("days >", value, "days");
            return (Criteria) this;
        }

        public Criteria andDaysGreaterThanOrEqualTo(String value) {
            addCriterion("days >=", value, "days");
            return (Criteria) this;
        }

        public Criteria andDaysLessThan(String value) {
            addCriterion("days <", value, "days");
            return (Criteria) this;
        }

        public Criteria andDaysLessThanOrEqualTo(String value) {
            addCriterion("days <=", value, "days");
            return (Criteria) this;
        }

        public Criteria andDaysLike(String value) {
            addCriterion("days like", value, "days");
            return (Criteria) this;
        }

        public Criteria andDaysNotLike(String value) {
            addCriterion("days not like", value, "days");
            return (Criteria) this;
        }

        public Criteria andDaysIn(List<String> values) {
            addCriterion("days in", values, "days");
            return (Criteria) this;
        }

        public Criteria andDaysNotIn(List<String> values) {
            addCriterion("days not in", values, "days");
            return (Criteria) this;
        }

        public Criteria andDaysBetween(String value1, String value2) {
            addCriterion("days between", value1, value2, "days");
            return (Criteria) this;
        }

        public Criteria andDaysNotBetween(String value1, String value2) {
            addCriterion("days not between", value1, value2, "days");
            return (Criteria) this;
        }

        public Criteria andIntolnumIsNull() {
            addCriterion("IntolNum is null");
            return (Criteria) this;
        }

        public Criteria andIntolnumIsNotNull() {
            addCriterion("IntolNum is not null");
            return (Criteria) this;
        }

        public Criteria andIntolnumEqualTo(Double value) {
            addCriterion("IntolNum =", value, "intolnum");
            return (Criteria) this;
        }

        public Criteria andIntolnumNotEqualTo(Double value) {
            addCriterion("IntolNum <>", value, "intolnum");
            return (Criteria) this;
        }

        public Criteria andIntolnumGreaterThan(Double value) {
            addCriterion("IntolNum >", value, "intolnum");
            return (Criteria) this;
        }

        public Criteria andIntolnumGreaterThanOrEqualTo(Double value) {
            addCriterion("IntolNum >=", value, "intolnum");
            return (Criteria) this;
        }

        public Criteria andIntolnumLessThan(Double value) {
            addCriterion("IntolNum <", value, "intolnum");
            return (Criteria) this;
        }

        public Criteria andIntolnumLessThanOrEqualTo(Double value) {
            addCriterion("IntolNum <=", value, "intolnum");
            return (Criteria) this;
        }

        public Criteria andIntolnumIn(List<Double> values) {
            addCriterion("IntolNum in", values, "intolnum");
            return (Criteria) this;
        }

        public Criteria andIntolnumNotIn(List<Double> values) {
            addCriterion("IntolNum not in", values, "intolnum");
            return (Criteria) this;
        }

        public Criteria andIntolnumBetween(Double value1, Double value2) {
            addCriterion("IntolNum between", value1, value2, "intolnum");
            return (Criteria) this;
        }

        public Criteria andIntolnumNotBetween(Double value1, Double value2) {
            addCriterion("IntolNum not between", value1, value2, "intolnum");
            return (Criteria) this;
        }

        public Criteria andSticksnumIsNull() {
            addCriterion("sticksNum is null");
            return (Criteria) this;
        }

        public Criteria andSticksnumIsNotNull() {
            addCriterion("sticksNum is not null");
            return (Criteria) this;
        }

        public Criteria andSticksnumEqualTo(Double value) {
            addCriterion("sticksNum =", value, "sticksnum");
            return (Criteria) this;
        }

        public Criteria andSticksnumNotEqualTo(Double value) {
            addCriterion("sticksNum <>", value, "sticksnum");
            return (Criteria) this;
        }

        public Criteria andSticksnumGreaterThan(Double value) {
            addCriterion("sticksNum >", value, "sticksnum");
            return (Criteria) this;
        }

        public Criteria andSticksnumGreaterThanOrEqualTo(Double value) {
            addCriterion("sticksNum >=", value, "sticksnum");
            return (Criteria) this;
        }

        public Criteria andSticksnumLessThan(Double value) {
            addCriterion("sticksNum <", value, "sticksnum");
            return (Criteria) this;
        }

        public Criteria andSticksnumLessThanOrEqualTo(Double value) {
            addCriterion("sticksNum <=", value, "sticksnum");
            return (Criteria) this;
        }

        public Criteria andSticksnumIn(List<Double> values) {
            addCriterion("sticksNum in", values, "sticksnum");
            return (Criteria) this;
        }

        public Criteria andSticksnumNotIn(List<Double> values) {
            addCriterion("sticksNum not in", values, "sticksnum");
            return (Criteria) this;
        }

        public Criteria andSticksnumBetween(Double value1, Double value2) {
            addCriterion("sticksNum between", value1, value2, "sticksnum");
            return (Criteria) this;
        }

        public Criteria andSticksnumNotBetween(Double value1, Double value2) {
            addCriterion("sticksNum not between", value1, value2, "sticksnum");
            return (Criteria) this;
        }

        public Criteria andSticksweightIsNull() {
            addCriterion("sticksWeight is null");
            return (Criteria) this;
        }

        public Criteria andSticksweightIsNotNull() {
            addCriterion("sticksWeight is not null");
            return (Criteria) this;
        }

        public Criteria andSticksweightEqualTo(Double value) {
            addCriterion("sticksWeight =", value, "sticksweight");
            return (Criteria) this;
        }

        public Criteria andSticksweightNotEqualTo(Double value) {
            addCriterion("sticksWeight <>", value, "sticksweight");
            return (Criteria) this;
        }

        public Criteria andSticksweightGreaterThan(Double value) {
            addCriterion("sticksWeight >", value, "sticksweight");
            return (Criteria) this;
        }

        public Criteria andSticksweightGreaterThanOrEqualTo(Double value) {
            addCriterion("sticksWeight >=", value, "sticksweight");
            return (Criteria) this;
        }

        public Criteria andSticksweightLessThan(Double value) {
            addCriterion("sticksWeight <", value, "sticksweight");
            return (Criteria) this;
        }

        public Criteria andSticksweightLessThanOrEqualTo(Double value) {
            addCriterion("sticksWeight <=", value, "sticksweight");
            return (Criteria) this;
        }

        public Criteria andSticksweightIn(List<Double> values) {
            addCriterion("sticksWeight in", values, "sticksweight");
            return (Criteria) this;
        }

        public Criteria andSticksweightNotIn(List<Double> values) {
            addCriterion("sticksWeight not in", values, "sticksweight");
            return (Criteria) this;
        }

        public Criteria andSticksweightBetween(Double value1, Double value2) {
            addCriterion("sticksWeight between", value1, value2, "sticksweight");
            return (Criteria) this;
        }

        public Criteria andSticksweightNotBetween(Double value1, Double value2) {
            addCriterion("sticksWeight not between", value1, value2, "sticksweight");
            return (Criteria) this;
        }

        public Criteria andBeamIsNull() {
            addCriterion("Beam is null");
            return (Criteria) this;
        }

        public Criteria andBeamIsNotNull() {
            addCriterion("Beam is not null");
            return (Criteria) this;
        }

        public Criteria andBeamEqualTo(Double value) {
            addCriterion("Beam =", value, "beam");
            return (Criteria) this;
        }

        public Criteria andBeamNotEqualTo(Double value) {
            addCriterion("Beam <>", value, "beam");
            return (Criteria) this;
        }

        public Criteria andBeamGreaterThan(Double value) {
            addCriterion("Beam >", value, "beam");
            return (Criteria) this;
        }

        public Criteria andBeamGreaterThanOrEqualTo(Double value) {
            addCriterion("Beam >=", value, "beam");
            return (Criteria) this;
        }

        public Criteria andBeamLessThan(Double value) {
            addCriterion("Beam <", value, "beam");
            return (Criteria) this;
        }

        public Criteria andBeamLessThanOrEqualTo(Double value) {
            addCriterion("Beam <=", value, "beam");
            return (Criteria) this;
        }

        public Criteria andBeamIn(List<Double> values) {
            addCriterion("Beam in", values, "beam");
            return (Criteria) this;
        }

        public Criteria andBeamNotIn(List<Double> values) {
            addCriterion("Beam not in", values, "beam");
            return (Criteria) this;
        }

        public Criteria andBeamBetween(Double value1, Double value2) {
            addCriterion("Beam between", value1, value2, "beam");
            return (Criteria) this;
        }

        public Criteria andBeamNotBetween(Double value1, Double value2) {
            addCriterion("Beam not between", value1, value2, "beam");
            return (Criteria) this;
        }

        public Criteria andStautsIsNull() {
            addCriterion("stauts is null");
            return (Criteria) this;
        }

        public Criteria andStautsIsNotNull() {
            addCriterion("stauts is not null");
            return (Criteria) this;
        }

        public Criteria andStautsEqualTo(Integer value) {
            addCriterion("stauts =", value, "stauts");
            return (Criteria) this;
        }

        public Criteria andStautsNotEqualTo(Integer value) {
            addCriterion("stauts <>", value, "stauts");
            return (Criteria) this;
        }

        public Criteria andStautsGreaterThan(Integer value) {
            addCriterion("stauts >", value, "stauts");
            return (Criteria) this;
        }

        public Criteria andStautsGreaterThanOrEqualTo(Integer value) {
            addCriterion("stauts >=", value, "stauts");
            return (Criteria) this;
        }

        public Criteria andStautsLessThan(Integer value) {
            addCriterion("stauts <", value, "stauts");
            return (Criteria) this;
        }

        public Criteria andStautsLessThanOrEqualTo(Integer value) {
            addCriterion("stauts <=", value, "stauts");
            return (Criteria) this;
        }

        public Criteria andStautsIn(List<Integer> values) {
            addCriterion("stauts in", values, "stauts");
            return (Criteria) this;
        }

        public Criteria andStautsNotIn(List<Integer> values) {
            addCriterion("stauts not in", values, "stauts");
            return (Criteria) this;
        }

        public Criteria andStautsBetween(Integer value1, Integer value2) {
            addCriterion("stauts between", value1, value2, "stauts");
            return (Criteria) this;
        }

        public Criteria andStautsNotBetween(Integer value1, Integer value2) {
            addCriterion("stauts not between", value1, value2, "stauts");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}