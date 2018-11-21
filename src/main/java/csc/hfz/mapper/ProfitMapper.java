package csc.hfz.mapper;


import csc.hfz.pojo.Profit;
import csc.hfz.pojo.ProfitExample;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ProfitMapper {
    int countByExample(ProfitExample example);

    int deleteByExample(ProfitExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Profit record);

    int insertSelective(Profit record);

    List<Profit> selectByExample(ProfitExample example);

    Profit selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Profit record, @Param("example") ProfitExample example);

    int updateByExample(@Param("record") Profit record, @Param("example") ProfitExample example);

    int updateByPrimaryKeySelective(Profit record);

    int updateByPrimaryKey(Profit record);
    
    
    //分页
  	List<Profit> getallList(Map<String, Object> param);
  	
  	//判断参数是否存在已有单价
  	Profit isHaveByPUname(String pname,String uname);
}