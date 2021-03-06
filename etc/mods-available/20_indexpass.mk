# NOTE: If you add this module, add its counterpart 20_indexpass.mk as well.
#
# Allow the user to denotate a class of source documents that should be
# processed only after all others, with a .index extension. Useful for e.g. rss
# feeds or sitemap builders.
targets := $(filter-out %.index,$(targets)) $(addprefix I/,$(filter %.index,$(targets)))
targets := $(targets:.index=)
