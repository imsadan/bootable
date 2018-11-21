package csc.hfz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import csc.hfz.mapper.ListallMapper;
import csc.hfz.pojo.Listall;




@Service
public class listServiceImpl implements listService {
    
	@Autowired
	private ListallMapper listallMapper;


	@Override
	public Map<String, Object> getallList(Map<String, Object> param) {
		Map<String,Object> result = new HashMap<String,Object>();
		int total=listallMapper.getallList(null).size();
		List<Listall> rows=listallMapper.getallList(param);
		result.put("total",total);
        result.put("rows",rows);
        return result;
	}

}
