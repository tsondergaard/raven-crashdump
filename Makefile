rpm:
	rpmbuild -bb \
         --define="raven_coredump_source_dir $(CURDIR)" \
         --define="raven_coredump_version $$($(CURDIR)/raven-coredump --version)" \
         raven-coredump.spec
