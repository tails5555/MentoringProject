package net.skhu.mentoring.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.Department;

@Mapper
public interface DepartmentMapper {
    List<Department> findAll();
    Department findOne(@Param("deptId") String deptId);
}

