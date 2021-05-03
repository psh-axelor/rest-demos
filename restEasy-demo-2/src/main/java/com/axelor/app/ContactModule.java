package com.axelor.app;

import com.google.inject.AbstractModule;

public class ContactModule extends AbstractModule {

	@Override
	protected void configure() {
		bind(ContactResources.class);
		bind(ContactService.class).to(ContactServiceImpl.class);
	}
}
