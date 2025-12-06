.PHONY: check_empty generate generate_tuist

projects ?=

ifeq ($(projects),<#custom_all_targets_tag#>)
    projects_option =
else
    projects_option = $(strip $(projects))
endif

generate: 
	@if [ -z "$${projects}" ] && [ -z "$${all_targets}" ]; then \
		./scripts/cli_generator.sh; \
	else \
		$(MAKE) project_generate; \
	fi
	

project_generate:
	@ tuist install
	@ tuist generate $(projects_option)
