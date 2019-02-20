package com.newtronics.common;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;

public class ActivitiMailService implements JavaDelegate {

	@Override
	public void execute(DelegateExecution execution) {
		String a = (String) execution.getVariable("mailTo");
		if(a != null) {
			
		}
	}

}
