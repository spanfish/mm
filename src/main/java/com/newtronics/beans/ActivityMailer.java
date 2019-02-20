package com.newtronics.beans;

import java.util.List;

import org.activiti.bpmn.model.FieldExtension;
import org.activiti.bpmn.model.TaskWithFieldExtensions;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;


public class ActivityMailer implements JavaDelegate {
	@Override
	public void execute(DelegateExecution execution) {
		List<FieldExtension> fieldExtensions = ((TaskWithFieldExtensions) execution.getCurrentFlowElement()).getFieldExtensions();
		for (FieldExtension fieldExtension : fieldExtensions) {
			String name = fieldExtension.getFieldName();
			String value = fieldExtension.getStringValue();
			if(value != null) {
				
			}
		}
		String a = (String) execution.getVariable("mailTo");

		
		a = (String) execution.getVariableLocal("mailTo");
		a = (String) execution.getTransientVariableLocal("mailTo");
		a = (String) execution.getVariable("mailTo");
		if (a != null) {

		}
	}
}
