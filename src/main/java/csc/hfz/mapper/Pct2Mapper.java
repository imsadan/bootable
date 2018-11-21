package csc.hfz.mapper;

import java.util.List;

import csc.hfz.pojo.City;

public interface Pct2Mapper {
   //点击省查出所有的城市列表
	public List<City> queryCity(int pid);
}
