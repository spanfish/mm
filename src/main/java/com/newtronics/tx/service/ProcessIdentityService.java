package com.newtronics.tx.service;

import java.util.List;

import org.activiti.engine.identity.Group;

public interface ProcessIdentityService {

	void newGroup(String groupId);
	List<Group> findAllGroups();
}
