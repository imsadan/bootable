package csc.hfz.mapper;

import csc.hfz.pojo.Yeartotal;
import csc.hfz.pojo.YeartotalExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface YeartotalMapper {
    int countByExample(YeartotalExample example);

    int deleteByExample(YeartotalExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Yeartotal record);

    int insertSelective(Yeartotal record);

    List<Yeartotal> selectByExample(YeartotalExample example);

    Yeartotal selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Yeartotal record, @Param("example") YeartotalExample example);

    int updateByExample(@Param("record") Yeartotal record, @Param("example") YeartotalExample example);

    int updateByPrimaryKeySelective(Yeartotal record);

    int updateByPrimaryKey(Yeartotal record);
    
    //按年月判断是否存在
    Yeartotal isHaveOfmonths(String years,String months);
    
    //参数年获取统计
    List<Yeartotal> showYeartotals(String years);
}