package csc.hfz.mapper;

import java.util.List;

import csc.hfz.pojo.Town;

public interface Pct3Mapper {
	//点击城市查询所有乡镇列表
	public List<Town> queryTown(int cid);
}
