package com.shsxt.crm.dao;

import com.shsxt.base.BaseMapper;
import com.shsxt.crm.dto.TreeDto;
import com.shsxt.crm.vo.Module;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ModuleMapper extends BaseMapper<Module,Integer> {

    public List<TreeDto> queryAllModules();

    Module queryModuleByGradeAndModuleName(@Param("grade") Integer grade, @Param("moduleName") String moduleName);

    Module queryModuleByGradeAndUrl(@Param("grade")Integer grade, @Param("url")  String url);

    Module queryModuleByOptValue(String optValue);

    List<Map<String, Object>> queryAllModulesByGrade(Integer grade);
}