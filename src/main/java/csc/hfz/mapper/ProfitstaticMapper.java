package csc.hfz.mapper;

import csc.hfz.pojo.Profitstatic;
import csc.hfz.pojo.ProfitstaticExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ProfitstaticMapper {
    int countByExample(ProfitstaticExample example);

    int deleteByExample(ProfitstaticExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Profitstatic record);

    int insertSelective(Profitstatic record);

    List<Profitstatic> selectByExample(ProfitstaticExample example);

    Profitstatic selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Profitstatic record, @Param("example") ProfitstaticExample example);

    int updateByExample(@Param("record") Profitstatic record, @Param("example") ProfitstaticExample example);

    int updateByPrimaryKeySelective(Profitstatic record);

    int updateByPrimaryKey(Profitstatic record);
    
    //按经纬
    List<Profitstatic> LookStaticOfPrice(String pname,String uname);
}