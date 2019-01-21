package com.newtronics.tx.service;

import com.newtronics.tx.model.Plan;
import com.newtronics.tx.model.Template;

public interface MailService {

	void sendReviewEmail(final String userName, final Plan model, final Template template);
	
	void sendRejectEmail(final String userName, final Plan model, final Template template);
	
	void sendApproveEmail(final String userName, final Plan model, final Template template);
	
	void sendCompleteEmail(final String userName, final Plan model, final Template template);
}
