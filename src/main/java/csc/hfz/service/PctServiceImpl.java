package csc.hfz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import csc.hfz.mapper.Pct2Mapper;
import csc.hfz.mapper.Pct3Mapper;
import csc.hfz.mapper.PctMapper;
import csc.hfz.pojo.City;
import csc.hfz.pojo.Province;
import csc.hfz.pojo.Town;

@Service
public class PctServiceImpl implements PctService {
	
    @Autowired
	private PctMapper pctMapper;
    @Autowired
    private Pct2Mapper pct2Mapper;
    @Autowired
    private Pct3Mapper pct3Mapper;
    
	@Override
	public List<Province> queryProvince() {
		return pctMapper.queryProvince();
	}
	@Override
	public List<City> queryCity(int pid) {
		return pct2Mapper.queryCity(pid);
	}
	@Override
	public List<Town> queryTown(int cid) {
		return pct3Mapper.queryTown(cid);
	}
	

}

