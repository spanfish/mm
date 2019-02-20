package com.newtronics.tx.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newtronics.tx.service.ProcessIdentityService;

@Service
public class ProcessIdentityServiceImpl implements ProcessIdentityService {

	@Autowired
	private IdentityService identityService;
	
	@Override
	@Transactional(rollbackOn = { Exception.class })
	public void newGroup(String groupId) {
		Group group = identityService.newGroup(groupId);
		identityService.saveGroup(group);
	}

	@Override
	public List<Group> findAllGroups() {
		List<Group> groups = identityService.createGroupQuery().list();
		return groups;
	}

}
