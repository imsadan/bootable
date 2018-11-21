package csc.hfz.mapper;

import csc.hfz.pojo.Weinum;
import csc.hfz.pojo.WeinumExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WeinumMapper {
    int countByExample(WeinumExample example);

    int deleteByExample(WeinumExample example);

    int deleteByPrimaryKey(Long pid);

    int insert(Weinum record);

    int insertSelective(Weinum record);

    List<Weinum> selectByExample(WeinumExample example);

    Weinum selectByPrimaryKey(Long pid);

    int updateByExampleSelective(@Param("record") Weinum record, @Param("example") WeinumExample example);

    int updateByExample(@Param("record") Weinum record, @Param("example") WeinumExample example);

    int updateByPrimaryKeySelective(Weinum record);

    int updateByPrimaryKey(Weinum record);
    
    List<Weinum> getAllWeinums();
}