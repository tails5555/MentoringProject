package net.skhu.mentoring.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Profile;
import net.skhu.mentoring.mapper.ProfileMapper;
@Service
public class ProfileService {
	@Autowired ProfileMapper profileMapper;
	public Profile findOne(int id) {
		return profileMapper.findOne(id);
	}
	public Profile findByUserId(int userId) {
		return profileMapper.findByUserId(userId);
	}
}
