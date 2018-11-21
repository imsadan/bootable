package csc.hfz.mapper;

import csc.hfz.pojo.Daycloths;
import csc.hfz.pojo.DayclothsExample;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface DayclothsMapper {
    int countByExample(DayclothsExample example);

    int deleteByExample(DayclothsExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Daycloths record);

    int insertSelective(Daycloths record);

    List<Daycloths> selectByExample(DayclothsExample example);

    Daycloths selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Daycloths record, @Param("example") DayclothsExample example);

    int updateByExample(@Param("record") Daycloths record, @Param("example") DayclothsExample example);

    int updateByPrimaryKeySelective(Daycloths record);

    int updateByPrimaryKey(Daycloths record);
    
    //分页
    List<Daycloths> findclothsByPage(HashMap<String,Object> map); 
    /**
     * 查询用户记录总数
     */
    int selectCount(String years,String months);
    
    //按days查询（年，月附带）
    List<Daycloths> getClothsByDays(String years,String months,String days);
    //按wei查询（年，月附带）
    List<Daycloths> LookStaticOfDayByWei(String years,String months,String wei,String jin);
}