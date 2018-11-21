package csc.hfz.mapper;

import csc.hfz.pojo.Dayplans;
import csc.hfz.pojo.DayplansExample;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface DayplansMapper {
    int countByExample(DayplansExample example);

    int deleteByExample(DayplansExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Dayplans record);

    int insertSelective(Dayplans record);

    List<Dayplans> selectByExample(DayplansExample example);

    Dayplans selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Dayplans record, @Param("example") DayplansExample example);

    int updateByExample(@Param("record") Dayplans record, @Param("example") DayplansExample example);

    int updateByPrimaryKeySelective(Dayplans record);

    int updateByPrimaryKey(Dayplans record);
    
    List<Dayplans> selectAllLimitByYearAndMonth(String years,String months);
    
    int updateStautsById(Dayplans record);
    
    //分页
    List<Dayplans> findByPage(HashMap<String,Object> map); 
    /**
     * 查询用户记录总数
     */
    int selectCount(String years,String months);
    
    
}