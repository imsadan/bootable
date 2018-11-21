package csc.hfz.mapper;

import csc.hfz.pojo.Jinnum;
import csc.hfz.pojo.JinnumExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface JinnumMapper {
    int countByExample(JinnumExample example);

    int deleteByExample(JinnumExample example);

    int deleteByPrimaryKey(Long uid);

    int insert(Jinnum record);

    int insertSelective(Jinnum record);

    List<Jinnum> selectByExample(JinnumExample example);

    Jinnum selectByPrimaryKey(Long uid);

    int updateByExampleSelective(@Param("record") Jinnum record, @Param("example") JinnumExample example);

    int updateByExample(@Param("record") Jinnum record, @Param("example") JinnumExample example);

    int updateByPrimaryKeySelective(Jinnum record);

    int updateByPrimaryKey(Jinnum record);
    
    List<Jinnum> getAllJinnums(); 
}