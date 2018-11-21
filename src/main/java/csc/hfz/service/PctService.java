package csc.hfz.service;

import java.util.List;

import csc.hfz.pojo.City;
import csc.hfz.pojo.Province;
import csc.hfz.pojo.Town;

public interface PctService {
	/**
	 * 查询所有省份
	 * 
	 * @return Province
	 */
	public List<Province> queryProvince();
	public List<City> queryCity(int pid);
	public List<Town> queryTown(int cid);
}

