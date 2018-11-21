package csc.hfz.controller;

import java.util.List;

public class pageHelps {
	private Integer total;
	private List<?> rows;

	public pageHelps() {
	}

	public pageHelps(Integer total, List<?> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}
}
