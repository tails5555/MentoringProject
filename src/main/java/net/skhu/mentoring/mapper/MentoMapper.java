package net.skhu.mentoring.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import net.skhu.mentoring.dto.Mento;
@Mapper
public interface MentoMapper {
	Mento findOne(int id);
	List<Mento> findAll();
	
	void insert(Mento mento);
	void update(Mento mento);
}
