package com.newtronics.tx.service;

import com.newtronics.tx.model.Plan;
import com.newtronics.tx.model.Template;

public interface MailService {

	void sendReviewEmail(final Plan model, final Template template);
}
