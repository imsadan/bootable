package csc.hfz.mapper;

import csc.hfz.pojo.Listall;
import csc.hfz.pojo.ListallExample;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ListallMapper {
    int countByExample(ListallExample example);

    int deleteByExample(ListallExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Listall record);

    int insertSelective(Listall record);

    List<Listall> selectByExample(ListallExample example);

    Listall selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Listall record, @Param("example") ListallExample example);

    int updateByExample(@Param("record") Listall record, @Param("example") ListallExample example);

    int updateByPrimaryKeySelective(Listall record);

    int updateByPrimaryKey(Listall record);
    
    //分页
	List<Listall> getallList(Map<String, Object> param);
}