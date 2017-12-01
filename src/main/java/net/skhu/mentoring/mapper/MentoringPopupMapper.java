package net.skhu.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.MentoringPopup;
@Mapper
public interface MentoringPopupMapper {
	List<MentoringPopup> findAll();
	List<MentoringPopup> findByType(@Param("popupType") int popupType);
	void insert(MentoringPopup mentoringPopup);
}
